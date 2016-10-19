(load "FixedPoint.scm")
(load "Ex143.scm")

(define (log2 x)
    (/ (log x) (log 2)))

(define (pow x n)
  (if (= n 0)
      1
      (* x (pow x (- n 1)))))

(define (n-root x n)
  (fixed-point-of-transform
   (lambda (y) (/ x (pow y (- n 1))))
   (repeated average-damp (floor (log2 n)))
   1.0))
