(defpackage :raindrops
  (:use :cl)
  (:export :convert))
(in-package :raindrops)

(defun convert (n)
  "Converts a number to a string of raindrop sounds."
  (if (zerop (length (setf result (concatenate 'string
          (and (zerop (mod n 3)) "Pling")
          (and (zerop (mod n 5)) "Plang")
          (and (zerop (mod n 7)) "Plong")
        )))
      )
      (format nil "~A" n)
  result)
)
