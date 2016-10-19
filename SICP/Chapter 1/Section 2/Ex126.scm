(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder
	  (* (expmod base (/ exp 2) m)
	     (expmod base (/ exp 2) m))
	  m))
	(else
	 (remainder
	  (* base
	     (expmod base (- exp 1) m))
	  m))))

; At each call of expmod, expmod is being evaluated twice (as opposed to once with square). Thus, the time complexity becomes O(log(2^n)) = O(n). Another way to think about it is that every time the exponent is halved in a run of the expmod procedure, expmod is called twice, thus creating an O(n) process.  
