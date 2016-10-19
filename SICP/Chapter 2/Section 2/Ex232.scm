(load "Trees.scm")

(define (subsets s)
  (if (null? s)
      (list (list))
      (let ((rest (subsets (cdr s))))
	(append rest
		(map (lambda (x) (cons (car s) x)) rest))
	)))

;The method recurses until it reaches an empty list
;Then, at each step, the total list is updated as follows:
; new list = current list joined to (current list with (car s)  prepended to all members)
; where (car s) is a different member of the list at each step (because the first number is chopped off with cdr on each recursive call to subsets)
;Thus at each step the number of lists is doubled: half with (car s), and half without (car s)
