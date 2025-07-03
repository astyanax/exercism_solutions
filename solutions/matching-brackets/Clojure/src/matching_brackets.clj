(ns matching-brackets)

(defn bracket? [input] (.contains "(){}[]" input))

(defn consume [stack, token]
  (case token
    "{" (conj stack "}")
    "[" (conj stack "]")
    "(" (conj stack ")")
    (if (= token (first stack))
      (rest stack)
      (reduced [:invalid]))))
    
(defn valid? [input]
  (empty? (reduce consume () (filter bracket? (map str input)))))