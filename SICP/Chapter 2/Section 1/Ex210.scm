(load "Ex28.scm")

(define (spans-zero-interval? i)
  (and (<= (lower-bound i) 0) (>= (upper-bound i) 0)))

(define (div-interval x y)
  (if (spans-zero-interval? y)
      (error "Error: divisor interval spans 0 " y)
      (mul-interval x
		    (make-interval
		     (/ 1.0 (upper-bound y))
		     (/ 1.0 (lower-bound y))))
      ))
