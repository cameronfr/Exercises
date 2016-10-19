(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder
	  (square (expmod base (/ exp 2) m))
	  m))
	(else
	 (remainder
	  (* base (expmod base (- exp 1) m))
	  m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n)
	 (fast-prime? n (- times 1)))
	(else false)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime n (- (runtime)
			 start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

;1e9 primes: 0.01, checking 100 times with the fermat test
;1e12 primes: 0.0.013, checking 100 times with the fermat test
;the difference should be around log(1e12)/log(1e9) ~= 1.33, which it is
; but discrepancies would probably be explained by the fact that only expmod has logarithmic growth, there may be an overhead constant time from the 100 times random must be called in fermat-test
