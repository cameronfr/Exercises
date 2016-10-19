(load "Newton.scm")

(define (new-if predicate
		then-clause
		else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x) x)))

;Because scheme uses applicative order execution, every argument to a method will be evulated before said method is called.
;Therefore, when new-if is called, all arguments will be evaluated. The predicate and the then clause will evaluate without issue; the problem is that the else clause,  sqrt-iter, will be evaluated infinitely, and the new-if method will never return anything.
