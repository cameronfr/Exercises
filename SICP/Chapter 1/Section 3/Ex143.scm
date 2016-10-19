(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))

(define (repeated fn n)
  (define (iter f k x)
    (cond
     ((= k 0) f x)
     (else (f (iter f (- k 1) x )))))
  (lambda (x) (iter fn n x)))
