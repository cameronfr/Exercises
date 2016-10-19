(define (cont-frac n d k)
  (define (iter i result)
    (cond
     ((= i 0) result)
     (else
      (iter (- i 1) (/ (n i) (+ (d i) result))))))
  (iter k 0))

(define (cont-frac-recur n d k)
  (define (iter i)
    (cond
     ((= i (+ k 1)) 0)
     (else (/ (n i) (+ (d i) (cont-frac-recur n d (+ i 1)))))))
  (iter 1))
;1/phi = 0.61803398875
;to be accurate to 4 decimal places, k > 13
