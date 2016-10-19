(load "Ex137.scm")

(define (e-approx k)
  (define (n i) 1.0)
  (define (d i)
    (if
     (= (remainder (+ i 1) 3) 0)
     (* (/ (+ i 1) 3) 2)
     1
     ))
  (+ 2 (cont-frac n d k)))
