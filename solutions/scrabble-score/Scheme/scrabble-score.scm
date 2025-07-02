(import (rnrs))

(define (score word)
  (let loop ((chars (string->list (string-downcase word)))
             (total 0))
    (if (null? chars)
        total
        (loop (cdr chars)
              (+ total
                 (case (car chars)
                   ((#\a #\e #\i #\o #\u #\l #\n #\r #\s #\t) 1)
                   ((#\d #\g) 2)
                   ((#\b #\c #\m #\p) 3)
                   ((#\f #\h #\v #\w #\y) 4)
                   ((#\k) 5)
                   ((#\j #\x) 8)
                   ((#\q #\z) 10)
                   (else 0)))))))
