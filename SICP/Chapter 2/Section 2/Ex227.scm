(load "Lists.scm")

(define (deep-reverse list1)
  (cond
   ((null? list1)  list1)
   ((pair? (car list1)) (append (reverse (cdr list1)) (list (reverse (car list1)))))
   (else (append (reverse (cdr list1)) (list (car list1))))
   ))
