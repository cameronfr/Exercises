(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1)
		 (A x (- y 1))))))

(A 1 10) ; 1024
(A 2 4) ; 65536
(A 3 3) ; 65536

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

; (f n) is 2n 
; (g n) is 2^n 
; (h n) is 2^2^2^2.... with (n) twos (tetration, for which the notation is apparently 2^^ n)

