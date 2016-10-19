(load "Ex242.scm")

;Original Method
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions)
	   (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1  board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))

;Louis's Method
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions)
	   (safe? k positions))
	 (flatmap
	  (lambda (new-row)
	    (map (lambda (rest-of-queens)
		   (adjoin-position new-row k rest-of-queens))
		 (queen-cols (- k 1))))
	  (enumerate-interval 1 board-size))
	 )))
  (queen-cols board-size))

;The original method, at each step, adds a queen from row 1 to n (board size) for each possible arrangement (rest of queens)
;Then all of these configurations are filtered, leaving only the valid ones
;Subsequently, this happens again with k incremented by one

;Louis's Method, at each step, for every row, adds the row to  (queen-cols (- k 1) -- each possible arrangement (rest of queens)), calling (queen-cols) for every row!
;Then these configurations are filtered...

; Thus Louis's method does everything the same except it calls (queen-cols) n-1 extra times at each step. If the original method takes T seconds for the 8 queens problem, then the original method made N calls to queen cols, and Louis's method N^N calls, so the time Louis's method would take would be on the order of T^8.
