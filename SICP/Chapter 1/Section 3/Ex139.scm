(load "Ex137.scm")

(define (tan-cf x k)
  (define (n i)
    (cond
     ((= i 1) x)
     (else (- (* x x)))
     ))
  (define (d i)
    (- (* 2 i) 1))
  (cont-frac n d k))
