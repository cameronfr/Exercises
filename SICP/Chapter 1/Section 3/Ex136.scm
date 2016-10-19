(load "FixedPoint.scm")

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display guess)
      (if (close-enough? guess next)
	  next
	  (try next))))
    (try first-guess))


(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
;no average damping, takes 34 steps give or take
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0)
;average damping, only takes 9 steps
