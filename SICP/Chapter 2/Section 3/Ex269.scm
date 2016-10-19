(load "Huffman.scm")

(define (generate-huffman-tree pairs)
  (successive-merge
   (make-leaf-set pairs)))

(define (successive-merge pairs)
  (if (= (length pairs) 1)
      (car pairs)
      (successive-merge
       (adjoin-set
	(make-code-tree (car pairs) (cadr pairs))
	(cddr pairs)))))

(define pairs '((A 4) (B 2) (C 1) (D 1)))
(generate-huffman-tree pairs)
