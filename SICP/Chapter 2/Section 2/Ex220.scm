(load "Lists.scm")

(define (even? x)
  (= (remainder x 2) 0))

(define (same-parity x . y)
  (define (iter inlist outlist pred?)
    (cond
     ((null? inlist) outlist)
     ((pred? (car inlist)) (iter (cdr inlist) (append outlist (list (car inlist))) pred?))
     (else (iter (cdr inlist) outlist pred?))))
  (iter y (list x) even?))
