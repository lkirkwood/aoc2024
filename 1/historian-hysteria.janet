(def lines (string/split "\n" (slurp "input")))

(defn popn [arr index replacement]
  (def val (arr index))
  (array/remove arr index)
  val)

(defn main [&]
  (def [first_list second_list] [@[] @[]])
  (each line lines
    (if (> (length line) 0)
      (do
        (def [first_item second_item] (string/split "   " line))
        (array/push first_list (int/s64 first_item))
        (array/push second_list (int/s64 second_item))))
    )

  (var total 0)
  (while (> (length first_list) 0)
    (var [first_min second_min] [:unset :unset])
    (for i 0 (length first_list)
      (cond
        (= first_min :unset) (set first_min [i (first_list i)])
        (> (first_min 1) (first_list i)) (set first_min [i (first_list i)]))

      (cond
        (= second_min :unset) (set second_min [i (second_list i)])
        (> (second_min 1) (second_list i)) (set second_min [i (second_list i)]))
      )

      (def diff (math/abs (int/to-number (- (first_min 1) (second_min 1)))))
      (print (string (first_min 1) " - " (second_min 1) " = " diff))
      (array/remove first_list (first_min 0))
      (array/remove second_list (second_min 0))
      (set total (+ total diff))
    )

  (print (string "Total: " total))
  )

