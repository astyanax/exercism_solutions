(ns protein-translation)

(defn translate-codon [codon]
  (case codon
    ("AUG") "Methionine"
    ("UUU" "UUC") "Phenylalanine"
    ("UUA" "UUG") "Leucine"
    ("UCU" "UCC" "UCA" "UCG") "Serine"
    ("UAU" "UAC") "Tyrosine"
    ("UGU" "UGC") "Cysteine"
    ("UGG") "Tryptophan"
    ("UAA" "UAG" "UGA") "STOP"
    ""))

(defn translate-rna [rna]
  (->> rna
       (partition 3)
       (map clojure.string/join)
       (map translate-codon)
       (take-while (partial not= "STOP"))))