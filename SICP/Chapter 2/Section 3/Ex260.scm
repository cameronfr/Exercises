(define (element-of-set x s)
  (cond
   ((null? s) false)
   ((equal? (car s) x) true)
   (else (element-of-set x (cdr s)))))

(define (adjoin-set x s)
  (cons x s))

(define (union-set s1 s2)
  (if (null? s1)
      s2
      (cons (car s1) (union-set (cdr s1) s2))))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2))
	 '())
	((element-of-set? (car set1) set2)
	 (cons (car set1)
	       (intersection-set (cdr set1)
				 set2)))
	(else (intersection-set (cdr set1)
				set2))))

;Element-of-set is still O(n)
;adjoin-set is now O(1) instead of O(n)
;union-set is now O(n) instead of O(n^2)
;intersection set is still O(n^2)
;HOWEVER, these operations now increase the size of n carelessly
;therefore this implementation would be useful in applications where the chance of duplicates is low -- i.e. applications in which the chance that members of a set are not unique is low, and applications where we want to trade off memory for performance, and applications in which we use adjoin-set and union-set operations frequently.
