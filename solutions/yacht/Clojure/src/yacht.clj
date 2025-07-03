(ns yacht)

(defn- score-yacht 
  ([dice] (score-yacht (first dice) dice))
  ([value [die & rest]]
    (cond 
      (nil? die) 50
      (= value die) (score-yacht value rest)
      :else 0)))

(defn- score-number
  ([number dice] (score-number number dice 0))
  ([number [die & rest] total]
    (cond 
      (nil? die) total
      (= number die) (score-number number rest (+ total number))
      :else (score-number number rest total))))

(defn- map-dice
  ([dice] (map-dice {1 0 2 0 3 0 4 0 5 0 6 0} dice))
  ([dice-map [die & rest]]
    (cond
      (nil? die) (into {} (filter (fn [[_ v]] (> v 0))) dice-map)
      (contains? dice-map die) (map-dice (update dice-map die inc) rest)
      :else nil)))

(defn- full-house? [dice]
  (let [dice-map (map-dice dice)]
    (and (= 2 (count dice-map))
         (= 3 (apply max (vals dice-map))))))

(defn- score-full-house [dice]
  (if (full-house? dice) (reduce + dice) 0))

(defn- score-four-of-a-kind [dice] (->> dice
    map-dice
    (map (fn [[k v]] (if (>= v 4) (* k 4) 0)))
    (apply max)))

(defn- little-straight? [dice]
  (let [dice-map (map-dice dice)]
    (and  (= 1 (get dice-map 1))
          (= 1 (get dice-map 2))
          (= 1 (get dice-map 3))
          (= 1 (get dice-map 4))
          (= 1 (get dice-map 5)))))

(defn- score-little-straight [dice]
  (if (little-straight? dice) 30 0))

(defn- big-straight? [dice]
  (let [dice-map (map-dice dice)]
    (and (= 1 (get dice-map 2))
         (= 1 (get dice-map 3))
         (= 1 (get dice-map 4))
         (= 1 (get dice-map 5))
         (= 1 (get dice-map 6)))))

(defn- score-big-straight [dice]
  (if (big-straight? dice) 30 0))

(defn score [dice category]
  (case category 
    "yacht"           (score-yacht dice)
    "ones"            (score-number 1 dice)
    "twos"            (score-number 2 dice)
    "threes"          (score-number 3 dice)
    "fours"           (score-number 4 dice)
    "fives"           (score-number 5 dice)
    "sixes"           (score-number 6 dice)
    "full house"      (score-full-house dice)
    "four of a kind"  (score-four-of-a-kind dice)
    "little straight" (score-little-straight dice)
    "big straight"    (score-big-straight dice)
    "choice"          (reduce + dice)
    nil))