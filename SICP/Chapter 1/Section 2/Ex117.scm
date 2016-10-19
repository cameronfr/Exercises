(define (even? n)
  (= (remainder n 2) 0))

(define (double x)
  (* 2 x))

(define (half x)
  (/ x 2))

(define (mult b x)
  (cond
   ((= x 0) 0)
   ((even? x) (double (mult b  (half x))))
   (else (+ b (mult b (- x 1))))))

(define (mult-iter a b x)
  (cond
   ((= x 1) b)
   ((even? x) (mult-iter a (double b) (half x)))
   (else (mult-iter (+ a b) b (- x 1)))))
