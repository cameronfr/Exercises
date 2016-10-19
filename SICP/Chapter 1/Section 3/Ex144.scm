(load "Ex143.scm")

(define dx 0.001)

(define (smooth f)
  (lambda (x)
    ( / (+
	 (f (- x dx))
	 (f x)
	 (f (+ x dx))
	 )
	3
	)
    ))

(define (n-fold-smooth f n)
  (repeated (smooth f) n))
