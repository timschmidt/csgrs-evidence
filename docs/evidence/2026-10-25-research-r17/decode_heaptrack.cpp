#include <algorithm>
#include <cassert>
#include <charconv>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <map>
#include <set>
#include <stdexcept>
#include <string>
#include <string_view>
#include <vector>

struct Trace { uint64_t ip, parent; };
struct Allocation { uint64_t size, trace, live = 0; };

std::vector<uint64_t> hex_fields(std::string_view text) {
    std::vector<uint64_t> fields;
    while (!text.empty()) {
        auto end = text.find(' ');
        auto token = text.substr(0, end);
        uint64_t value = 0;
        auto result = std::from_chars(token.data(), token.data() + token.size(), value, 16);
        if (result.ec != std::errc() || result.ptr != token.data() + token.size())
            throw std::runtime_error("invalid hex field");
        fields.push_back(value);
        if (end == std::string_view::npos) break;
        text.remove_prefix(end + 1);
    }
    return fields;
}

int main(int argc, char** argv) {
    if (argc != 2) return 2;
    std::ios::sync_with_stdio(false);
    std::cin.tie(nullptr);
    std::vector<std::string> strings(1);
    std::vector<std::vector<uint64_t>> ips(1);
    std::vector<Trace> traces(1, {0, 0});
    std::vector<Allocation> allocations;
    uint64_t live = 0, peak = 0, requests = 0, adds = 0, frees = 0, lines = 0;
    uint64_t format = 0, timestamp = 0, peak_rss_pages = 0, page_size = 0;
    bool command_seen = false;
    std::string line;
    try {
        while (std::getline(std::cin, line)) {
            ++lines;
            if (line.size() > 8 * 1024 * 1024) throw std::runtime_error("overlong line");
            if (line.empty() || line[0] == '#') continue;
            if (line.size() < 2 || line[1] != ' ') throw std::runtime_error("bad record prefix");
            const std::string_view data(line.data() + 2, line.size() - 2);
            if (line[0] == 's') {
                auto delimiter = data.find(' ');
                auto length = hex_fields(data.substr(0, delimiter)).at(0);
                auto content = data.substr(delimiter + 1);
                if (format != 3 || content.size() != length) throw std::runtime_error("bad sized string");
                strings.emplace_back(content);
                continue;
            }
            if (line[0] == 'X') {
                if (command_seen) throw std::runtime_error("duplicate command");
                command_seen = true;
                continue;
            }
            if (line[0] == 'S') continue; // No suppressions are applied.
            const auto fields = hex_fields(data);
            switch (line[0]) {
            case 'v':
                if (fields.size() != 2 || fields[1] != 3) throw std::runtime_error("unsupported format");
                format = fields[1];
                break;
            case 'i': {
                if (fields.size() < 2) throw std::runtime_error("short instruction pointer");
                std::vector<uint64_t> functions;
                for (size_t i = 2; i < fields.size(); i += 3) {
                    if (fields[i] >= strings.size()) throw std::runtime_error("bad function reference");
                    functions.push_back(fields[i]);
                }
                ips.push_back(std::move(functions));
                break;
            }
            case 't':
                if (fields.size() != 2 || fields[0] >= ips.size() || fields[1] >= traces.size())
                    throw std::runtime_error("bad trace reference");
                traces.push_back({fields[0], fields[1]});
                break;
            case 'a':
                if (fields.size() != 2 || fields[1] >= traces.size()) throw std::runtime_error("bad allocation info");
                allocations.push_back({fields[0], fields[1], 0});
                break;
            case '+': {
                auto& value = allocations.at(fields.at(0));
                ++value.live; ++adds; requests += value.size; live += value.size;
                peak = std::max(peak, live);
                break;
            }
            case '-': {
                auto& value = allocations.at(fields.at(0));
                if (!value.live || live < value.size) throw std::runtime_error("unmatched free");
                --value.live; ++frees; live -= value.size;
                break;
            }
            case 'c':
                if (fields.at(0) < timestamp) throw std::runtime_error("decreasing timestamp");
                timestamp = fields[0];
                break;
            case 'R': peak_rss_pages = std::max(peak_rss_pages, fields.at(0)); break;
            case 'I': page_size = fields.at(0); break;
            default: throw std::runtime_error("unhandled record");
            }
        }
        if (!std::cin.eof() || format != 3 || !command_seen) throw std::runtime_error("incomplete input");
        std::map<uint64_t, std::pair<uint64_t, uint64_t>> retained;
        for (const auto& a : allocations) {
            if (a.live) {
                retained[a.trace].first += a.live * a.size;
                retained[a.trace].second += a.live;
            }
        }
        std::set<uint64_t> needed_traces, needed_ips, needed_strings;
        std::ofstream values(std::string(argv[1]) + "/live.tsv");
        uint64_t checked = 0, blocks = 0;
        for (const auto& [trace, count] : retained) {
            values << trace << '\t' << count.first << '\t' << count.second << '\n';
            checked += count.first; blocks += count.second;
            for (auto node = trace; node && needed_traces.insert(node).second; node = traces[node].parent)
                needed_ips.insert(traces[node].ip);
        }
        if (checked != live || blocks != adds - frees) throw std::runtime_error("accounting mismatch");
        std::ofstream nodes(std::string(argv[1]) + "/nodes.tsv");
        for (auto n : needed_traces) nodes << n << '\t' << traces[n].ip << '\t' << traces[n].parent << '\n';
        std::ofstream frames(std::string(argv[1]) + "/frames.tsv");
        for (auto ip : needed_ips) {
            frames << ip;
            for (auto function : ips[ip]) { frames << '\t' << function; needed_strings.insert(function); }
            frames << '\n';
        }
        std::ofstream symbols(std::string(argv[1]) + "/symbols.tsv");
        for (auto id : needed_strings) symbols << id << '\t' << strings[id] << '\n';
        if (!values || !nodes || !frames || !symbols) throw std::runtime_error("output failure");
        std::cout << "{\"live_bytes\":" << live << ",\"peak_bytes\":" << peak
                  << ",\"requested_bytes\":" << requests << ",\"allocations\":" << adds
                  << ",\"frees\":" << frees << ",\"live_blocks\":" << blocks
                  << ",\"positive_traces\":" << retained.size() << ",\"all_traces\":" << traces.size()-1
                  << ",\"all_allocation_infos\":" << allocations.size() << ",\"parsed_lines\":" << lines
                  << ",\"peak_rss_bytes\":" << peak_rss_pages * page_size << "}\n";
    } catch (const std::exception& error) {
        std::cerr << "line " << lines << ": " << error.what() << '\n';
        return 1;
    }
}
