(define (union-set s1 s2)
  (cond
   ((or (null? s1) (null? s2)) (append s1 s2))
   ((= (car s1) (car s2))
    (cons (car s1) (union-set (cdr s1) (cdr s2))))
   ((> (car s1) (car s2))
    (cons (car s2) (union-set s1 (cdr s2))))
   ((< (car s1) (car s2))
    (cons (car s1) (union-set (cdr s1) s2)))
   ))
   
