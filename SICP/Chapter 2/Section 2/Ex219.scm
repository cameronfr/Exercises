(define (cc amount coin-values)
  (define (except-first-denomination values)
    (cdr values))
  (define (first-denomination values)
    (car values))
  (define (no-more? values)
    (null? values))
  (cond ((= amount 0)
	 1)
	((or (< amount 0)
	     (no-more? coin-values))
	 0)
	(else
	 (+ (cc
	     amount
	     (except-first-denomination
	      coin-values))
	    (cc
	     (- amount
		(first-denomination
		 coin-values))
	     coin-values)))))

(define us-coins
  (list 50 25 10 5 1))

(define us-coins-outoforder
  (list 25 50 10 5 1))

;the order does not matter, as the count-change program has no reliance on the coins being in order: all possible coin combos are evaluated regardles

(define uk-coins
  (list 100 50 20 10 5 2 1 0.5))

