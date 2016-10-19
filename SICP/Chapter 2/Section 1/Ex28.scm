(load "Ex27.scm")

;the diff between a and b will be [min diff,max diff] =  [lower of a - upper of b, upper of a - lower of b]

(define (sub-interval x y)
  (make-interval
   (- (lower-bound x) (upper-bound y))
   (- (upper-bound x) (lower-bound y))))
