(define (square-list items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons (square (car things))
		    answer))))
  (iter items nil))

;This method creates a backwards list because the "answer" list is created by sequentially adding on the front of the "things" input list, thus resulting in a list with the beginning of "things" at the end

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons answer
		    (square
		     (car things))))))
  (iter items `()))

;This method doesn't work because the list is being passed as the first argument to cons instead of the second, preventing a list from forming -- a nested cons will form instead, as the second part of the cons never points to another construct
