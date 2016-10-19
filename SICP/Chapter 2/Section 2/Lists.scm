(define one-through-four (list 1 2 3 4))
(car (cdr one-through-four))
(cons 5 one-through-four)

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items)
		(- n 1))))

(define squares
  (list 1 4 9 16 25))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define odds
  (list 1 3 5 7))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
	    (append (cdr list1)
		    list2))))

(define (scale-list items factor)
  (if (null? items)
      nil
      (cons (* (car items) factor)
	    (scale-list (cdr items)
			factor))))

;(define (map proc items)
;  (if (null? items)
;      '()
;      (cons (proc (car items))
;	    (map proc (cdr items)))))

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
                     items))


