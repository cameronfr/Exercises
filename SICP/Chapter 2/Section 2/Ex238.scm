(load "Sequences.scm")

(define (fold-right . y)
  (apply accumulate y))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
    (iter initial sequence))

(fold-right / 1 (list 1 2 3))
(fold-left  / 1 (list 1 2 3))
(fold-right list `() (list 1 2 3))
(fold-left  list `() (list 1 2 3))
;for the same results, the following must be equivalent for the procedure f: (f x y) and (f y x)
