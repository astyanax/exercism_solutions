(import (rnrs))

(define (dna->rna dna)
  (list->string (map (lambda (nuc) (case nuc [(#\C) #\G] [(#\G) #\C] [(#\A) #\U] [(#\T) #\A]) ) (string->list dna))))

