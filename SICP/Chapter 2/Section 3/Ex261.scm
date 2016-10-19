(load "OrderedSets.scm")

(define (adjoin-set x s)
  (cond
   ((null? s) x)
   ((< (car s) x) (cons (car s) (adjoin-set x (cdr s))))
   (else (cons x s))))
;this procedure takes about half as many steps as the unordered version, because we only need to iterate on average halfway through the list before we find a location where we can insert the number which in a way that keeps the list sorted.
