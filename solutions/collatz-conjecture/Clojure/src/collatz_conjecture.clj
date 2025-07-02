(ns collatz-conjecture)

(defn collatz
  ([n] (collatz n 0))
  ([n steps]
   (cond
     (< n 1) (throw (IllegalArgumentException. "Zero or negative value"))
     (= n 1) steps
     (even? n) (collatz (/ n 2) (inc steps))
     (odd? n) (collatz (inc (* n 3)) (inc steps)))))