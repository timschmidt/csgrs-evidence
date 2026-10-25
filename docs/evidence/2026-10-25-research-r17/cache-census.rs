static R17_CACHE_STATES: [std::sync::atomic::AtomicU64; 8] =
    [const { std::sync::atomic::AtomicU64::new(0) }; 8];

impl CachedEvaluation {
    fn r17_state(&self) -> usize {
        usize::from(self.approximation.is_some())
            | (usize::from(self.quadratic_tower.is_some()) << 1)
            | (usize::from(self.radical_tower_declined) << 2)
    }
}

fn r17_cache_transition(before: usize, after: usize) {
    if before != after {
        R17_CACHE_STATES[after].fetch_add(1, std::sync::atomic::Ordering::Relaxed);
        R17_CACHE_STATES[before].fetch_sub(1, std::sync::atomic::Ordering::Relaxed);
    }
}

impl Computable {
    #[doc(hidden)]
    pub fn r17_diagnostic_cache_census() -> ([u64; 8], usize) {
        (
            std::array::from_fn(|index| {
                R17_CACHE_STATES[index].load(std::sync::atomic::Ordering::Relaxed)
            }),
            std::mem::size_of::<std::sync::RwLock<CachedEvaluation>>(),
        )
    }

    #[doc(hidden)]
    pub fn r17_diagnostic_cache_check() {
        let (before, _) = Self::r17_diagnostic_cache_census();
        for mask in 0..8 {
            let cache = EvaluationCache::new();
            let _ = cache.cell_or_init();
            if mask & 1 != 0 {
                cache.store(-64, BigInt::from(17));
            }
            if mask & 2 != 0 {
                cache.store_quadratic_tower(&Tower::rational(
                    Rational::fraction(7, 3).unwrap(),
                ));
            }
            if mask & 4 != 0 {
                cache.mark_radical_tower_declined();
            }
            let mut expected = before;
            expected[mask] += 1;
            assert_eq!(Self::r17_diagnostic_cache_census().0, expected);
            drop(cache);
            assert_eq!(Self::r17_diagnostic_cache_census().0, before);
        }
    }
}
