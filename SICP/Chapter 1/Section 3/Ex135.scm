(load "FixedPoint.scm")

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
