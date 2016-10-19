(define (square x)
  (* x x))

(define (expmod-mr base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder
	  (square (nontrivial-sqrt (expmod base (/ exp 2) m)))
	  m))
	(else
	 (remainder
	  (* base (expmod base (- exp 1) m))
	  m))))

(define (nontrivial-sqrt base n)
  (cond
   ((= n base) n)
   ((= n 1) n)
   ((= (remainder (square n) (+ base 1)) 1) 0)
   (else n)))

(define (fermat-test-mr n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime-mr? n times)
  (cond ((= times 0) true)
	((fermat-test-mr n)
	 (fast-prime-mr? n (- times 1)))
	(else false)))

(fast-prime-mr? 561 100) 
(fast-prime-mr? 1105 100) 
(fast-prime-mr? 1729 100) 
(fast-prime-mr? 2465 100) 
(fast-prime-mr? 2821 100) 
(fast-prime-mr? 6601 100) 
