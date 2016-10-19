(define (for-each proc list)
  (cond
   ((not (null? list))
    (proc (car list))
    (for-each proc (cdr list)))))
