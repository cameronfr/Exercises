(load "Huffman.scm")
(load "Ex267.scm")

(define (memq? obj list)
  (not (eq? (memq obj list) false)))
  
(define (encode message tree)
  (if (null? message)
      '()
      (append
       (encode-symbol (car message)
		      tree)
       (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (encode-symbol-1 subtree path)
    (if (leaf? subtree)
	(if (eq? (symbol-leaf subtree) symbol)
	    path
	    `())
	(let ((left (encode-symbol-1 (left-branch subtree) (append path '(0))))
	      (right (encode-symbol-1 (right-branch subtree) (append path '(1)))))
	  (if (null? left)
	      right
	      left))))
  (let ((value (encode-symbol-1 tree `())))
    (if (null? value)
	(error "ERROR: Symbol not found " symbol)
	value)))
;Note: this searches every single leaf

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

(encode '(a d a b b c a) sample-tree)
