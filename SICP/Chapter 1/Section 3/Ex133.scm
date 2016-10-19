(load "../Section 2/Ex123.scm")
(load "Sum.scm")

(define (filtered-accumulate filter? combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (if (filter? a)
			   (combiner result (term a))
			   result))))
  (iter a null-value))
(define (sum-primes a b)
  (filtered-accumulate prime? + 0 identity a inc b);sum of primes from a to b
  )

(define (prod-relprime n)
  (define (relprime? x)
    (= (gcd x n) 1))
  (filtered-accumulate relprime? * 1 identity 1 inc (- n 1)))

; b is the bigger number 
(define (gcd a b)
  (define (iter n)
    (if (and (divides? n a) (divides? n b))
	n
	(iter (- n 1))))
  (iter a))
   
