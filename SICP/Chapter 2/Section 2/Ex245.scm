(define (split arrangement operation)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split arrangement operation) painter (- n 1))))
          (arrangement painter (operation smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))
