(define (f-recur n)
  (cond ((< n 3) n)
	(else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))

(define (f-iter a b c count)
  (if (= count 1)
      a
      (f-iter b c (+ c (* 2 b) (* 3 a)) (- count 1) )))

(define (f n)
  (f-iter 1 2 4 n))
  
