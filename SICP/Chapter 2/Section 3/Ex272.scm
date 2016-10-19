(define (encode message tree)
  (if (null? message)
      '()
      (append
       (encode-symbol (car message)
		      tree)
       (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (if (leaf? tree)
      '()
      (let (
	    (left (left-branch tree))
	    (right (right-branch tree)))
	(cond
	 ((memq? symbol (symbols left))
	  (cons 0 (encode-symbol symbol left)))
	 ((memq? symbol (symbols right))
	  (cons 1 (encode-symbol symbol right)))
	 (else (error "ERROR: Symbol not found " symbol))
	 ))))

;if the huffman tree were balanced, the growth of the steps needed to encode a symbol would be O(log n * log n) (log n steps to the leaf, and a search through a decreasing number of elements at each step_, where n is the number of symbols.

;with a tree as in exercise 2.71:
; most frequent: would be first in a branch of the root, so only the initial search of O(n) complexity is required
; least frequent: encode symbol would be called on n-1 branches performing a search of a decreasing number of items, but because the items are decreasing linearly (by 1 each step) the overall complexity is still O(n^2)
