(define (average x y)
    (/ (+ x y) 2))

(define (iterative-improve good-enough? improve-guess)
  (define (iter guess)
    (if (good-enough? guess)
	guess
	(iter (improve-guess guess))))
  (lambda (x) (iter x)))

(define (sqrt n)
   (define (good-enough? x) (< (abs (- (* x x) n)) 0.001))
   (define (improve x) (average x (/ n x)))
   ((iterative-improve good-enough? improve) 1.0))

(define (fixed-point f initial)
  (define tolerance 0.00001)
  (define (close-enough? guess)
    (< (abs (- guess (improve guess))) tolerance))
  
  (define (improve guess) (f guess))
  ((iterative-improve close-enough? improve) initial))
