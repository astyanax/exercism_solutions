(ns robot-simulator)

(defn robot [coordinates bearing]
  {:coordinates coordinates, :bearing bearing})

(def bearings   [:north :east :south :west])
(def turn-right (zipmap bearings (drop 1 (cycle bearings))))
(def turn-left  (zipmap bearings (drop 3 (cycle bearings))))
(def advance    (zipmap bearings [[:y inc] [:x inc] [:y dec] [:x dec]]))

(def move {
  \R #(update % :bearing turn-right)
  \L #(update % :bearing turn-left)
  \A #(let [a (advance (:bearing %))] (update-in % [:coordinates (first a)] (second a)))})

(defn simulate [path robot]
  (reduce #((move %2) %1) robot path))