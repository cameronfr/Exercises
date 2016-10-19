(define (make-center-percent c p)
  (let ((w (* c p)))
    (make-interval (- c w) (+ c w))))

(define (center i)
  (/ (+ (lower-bound i)
	(upper-bound i))
     2))

(define (percent i)
  (let ((a (lower-bound i))
	(b (upper-bound i)))
    (/ (- b a) (+ b a))))
