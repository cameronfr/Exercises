(define (key record)
  (car record))

(define (value record)
  (car record)) ; in a real implementation value would be some other part of the record not equal to the key

(define (lookup given-key tree)
  (cond
   ((null? tree) (error "ERROR: Key not found, key:" given-key))
   ((= given-key (key tree)) (value tree))
   ((< given-key (key tree)) (lookup given-key (cadr tree)))
   ((> given-key (key tree)) (lookup given-key (caddr tree)))
   ))
