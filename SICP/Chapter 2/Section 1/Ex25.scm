;2^a * 3^b will preserve a and b (as 2 and 3 are prime)
;n = 2^a*3^b
;(n)/(2^a) = 3^b
;b*log3 = logn - alog2 
;b = (logn - alog2) / log3
;and similarly
;a = (logn - blog3) / log2
;but we cant use this because we dont know the other number
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car x)
  (num-ns x 2))

(define (cdr x)
  (num-ns x 3))

(define (num-ns x n)
  (define (iter num iters)
    (if (= (remainder num n) 0)
	(iter (/ num n) (+ iters 1))
	iters
	))
  (iter x 0))

(car (cons 10 2))
(cdr (cons 10 2))
(car (cons 10 0))
(cdr (cons 10 0))
    
