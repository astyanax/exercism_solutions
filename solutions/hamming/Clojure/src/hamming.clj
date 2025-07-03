(ns hamming)

(defn distance [s1 s2]
  (if (= (count s1) (count s2))
    (count (filter not (map = s1 s2))))
)
