(load "Differentiation.scm")

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2))
	 (+ a1 a2))
	(else (list a1 '+  a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0)
	     (=number? m2 0))
	 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2))
	 (* m1 m2))
	(else (list m1 '* m2))))

(define (sum? x)
  (and (pair? x)
       (not (eq? (split x '+) false))))

(define (addend s) 
  (car (split s '+)))
  
(define (augend s)  
  (cadr (split s '+)))

;force product to return true only if there is no '+ -- to preverse order of operations
(define (product? x)
  (and (pair? x)
       (not (sum? x))
       (not (eq? (split x '*) false))))

(define (multiplier p)
  (car (split p '*)))

(define (multiplicand p)
  (cadr (split p '*)))

(define (split inlist symbol)
  (define (split-iter list1 list2)
    (cond
     ((null? list1) false)
     ((eq? (car list1) symbol) (list (delist list2) (delist (cdr list1))))
     (else (split-iter (cdr list1) (cons (car list1) list2)))
     ))
  (split-iter inlist `()))

;(x) to x , if single symbol in list
(define (delist exp)
  (if (null? (cdr exp)) (car exp) exp))
		
    
