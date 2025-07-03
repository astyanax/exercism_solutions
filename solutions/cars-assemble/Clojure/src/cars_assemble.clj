(ns cars-assemble)

(def cars_per_hour 221)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (def production (* speed cars_per_hour))
  (def success_rate (cond (<= speed 0) 0.0
        (<= speed 4) 1.0
        (<= speed 8) 0.9
        (<= speed 9) 0.8
        (>= speed 10) 0.77
    )
   )
   (* production success_rate)
  )

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60)
       )
  )
