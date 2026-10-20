The first diagnostic checkout generated a fresh offline lockfile, selecting
newer cached registry versions. Its result is retained but is not the
matched-dependency baseline. The second attempt starts with the repository
lockfile; its final package-version subset must match before drawing a
baseline conclusion. Neither run is a cost benchmark or package-delivery test.
