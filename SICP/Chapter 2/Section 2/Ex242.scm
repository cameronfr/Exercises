(load "NestMap.scm")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1  board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board
  (list))

(define (adjoin-position row col board)
  (append board (list (list row col))))

(define (adjoin-position row col board) ;faster? not signifcantly
  (cons (list row col) board))

(define (safe? k positions)
  (let
      ((pos (car (filter (lambda (loc) (= (cadr loc) k)) positions))))
     (not
     (accumulate (lambda (x y) (or x y)) false
		 (map
		  (lambda (loc)
		    (and (not (= (cadr loc) k))
			 (or (= (car pos) (car loc))
			     (= (abs (- (car pos) (car loc))) (abs (- (cadr pos) (cadr loc)))))))
		  positions)))))

(queens 5);sanity check -- solutions are correct
;can verify number of solutions
(length (queens 5));10
(length (queens 6));4
(length (queens 7));40
(length (queens 8));92
(length (queens 9));352
