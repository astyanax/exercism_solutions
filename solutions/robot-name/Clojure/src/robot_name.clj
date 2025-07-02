(ns robot-name)

(defn- gen-rand-name []
  (format "%s%03d" (apply str (repeatedly 2 #(rand-nth (map char (range 65 91))))) (rand-int 1000)))

(defn robot []
  (atom (gen-rand-name)))

(defn robot-name [robot] @robot)

(defn reset-name [robot]
  (reset! robot (gen-rand-name)))