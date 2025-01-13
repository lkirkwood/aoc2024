(def input (slurp "input"))

(def mul
  '{
    :nums (<- (* (some :d) "," (some :d)))
    :mul (* "mul(" :nums ")")

    :do (* (<- "do") "()")
    :dont (* (<- "don't") "()")

    :valid (choice :mul :do :dont)
    :main (any (sequence
            (any (if-not :valid 1))
            :valid
            ))
    })

(defn string-to-num [s]
  (int/to-number (int/u64 s)))

(defn main [&]
  (var sum 0)
  (var enabled true)
  (def matches (peg/match mul input))
  (each item matches
    (match item
      "do" (set enabled true)
      "don't" (set enabled false)
      numstr (if enabled
              (do
                (def nums (string/split "," numstr))
                (def product (* (string-to-num (get nums 0)) (string-to-num (get nums 1))))
                (set sum (+ sum product))
                )
              )
        )
      )
  (print sum)
  )
