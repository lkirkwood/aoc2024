(def input (slurp "input"))

(def mul
  '{
    :nums (<- (* (some :d) "," (some :d)))
    :valid (* "mul(" :nums ")")
    :main (any (sequence
            (any (if-not :valid 1))
            :valid
            ))
    })

(defn string-to-num [s]
  (int/to-number (int/u64 s)))

(defn main [&]
  (var sum 0)
  (def matches (peg/match mul input))
  (each item matches
    (def nums (string/split "," item))
    (def product (* (string-to-num (get nums 0)) (string-to-num (get nums 1))))
    (set sum (+ sum product))
    )
  (print sum)
  )
