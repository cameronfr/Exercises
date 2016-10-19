(define (average a b)
  (/ (+ a b) 2))

(define (make-segment a b)
  (cons a b))

(define (start-segment a)
  (car a))

(define (end-segment b)
  (cdr b))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (equals-point a b)
  (and
   (= (x-point a) (x-point b))
   (= (y-point a) (y-point b))
   ))
   
(define (midpoint seg)
  (make-point
   (average (x-point (start-segment seg)) (x-point (end-segment seg)))
   (average (y-point (start-segment seg)) (y-point (end-segment seg)))
   ))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
    (display ")"))
