(define (abs x) (if (< x 0) (- x) x))

(define (make-rat n d)
  (let ((g (abs (gcd n d))))
    (cond ((< d 0)
	   (cons (/ (- n) g) (/ (- d) g)))
	  (else
	   (cons (/ n g) (/ d g))))))
