(def input-lines (string/split "\n" (slurp "input")))
(def reports (map
               (fn [line]
                    (map int/to-number
                        (map int/u64
                            (filter (fn [part] (not= part ""))
                                (string/split " " line)))))
               input-lines))

(defn max-delta [list]
  (var largest 0)
  (var last-num :unset)
  (each num list
    (if (= last-num :unset)
      (set last-num num)
      (do
        (set largest (max largest (math/abs (- num last-num))))))
        (set last-num num))

  largest
  )

(defn main [&]
  (var safe 0)
  (each report reports
    (if (> (length report) 0)
      (do
        (cond
            (< ;report) (if (< ;[0 (max-delta report) 4])
                        (set safe (+ safe 1)))
            (> ;report) (if (< ;[0 (max-delta report) 4])
                        (set safe (+ safe 1)))
              )
        )
    ))

  (print safe))
