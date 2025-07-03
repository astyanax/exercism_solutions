(defmodule anagram
  (export (find 2)))

(defun anagram (word1 word2)
  (let* ((lcase1 (string:to_lower word1))
         (lcase2 (string:to_lower word2)))
    (and (/= lcase1 lcase2) (== (lists:sort lcase1) (lists:sort lcase2)))))

(defun find (word candidates)
  (lists:filter (lambda (candidate) (anagram word candidate)) candidates))