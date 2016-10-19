(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
	 n)
	((divides? test-divisor n)
	 test-divisor)
	(else (find-divisor
	       n
	       (next test-divisor )))))

(define (next n)
  (cond
   ((= n 2) 3)
   (else (+ n 2))))

(define (divides? a b)
    (= (remainder b a) 0))

(define (even? n)
  (= (remainder n 2) 0))

(define (prime? n)
    (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime)
		       start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes-iter current end)
    (timed-prime-test current)
    (if (< current end)
	(search-for-primes (+ 2 current) end)
	))
(define (search-for-primes start end)
  (cond
   ((even? start) (search-for-primes-iter (+ start 1) end))
   (else (search-for-primes-iter start end))))
   

;Old smallest-divisor					

;START | AVG RUNTIME FOR FIRST 3 PRIMES
;1e9:  ~ 0.07
;1e10: ~ 0.2
;1e11: ~ 0.71
;1e12: ~ 2.32

;New smallest-divisor

;START | AVG RUNTIME FOR FIRST 3 PRIMES
;1e9:  ~ 0.04
;1e10: ~ 0.13
;1e11  ~ 0.4
;1e12  ~ 1.28
					;avg

;avg speedup is ~1.7 instead of 2, which could be explained by remainder taking longer for odds than evens, or that there is some overhead time between when timed-prime-test is called and start-prime-test is called, or that the procedure next takes significantly longer than +
