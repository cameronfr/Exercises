(define (list->tree elements)
  (car (partial-tree
	elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size
	     (quotient (- n 1) 2)))
	(let ((left-result
	       (partial-tree
		elts left-size)))
	  (let ((left-tree
		 (car left-result))
		(non-left-elts
		 (cdr left-result))
		(right-size
		 (- n (+ left-size 1))))
	    (let ((this-entry
		   (car non-left-elts))
		  (right-result
		   (partial-tree
		    (cdr non-left-elts)
		    right-size)))
	      (let ((right-tree
		     (car right-result))
		    (remaining-elts
		     (cdr right-result)))
		(cons (make-tree this-entry
				 left-tree
				 right-tree)
		      remaining-elts))))))))

;At each step, a tree is created. The left subtree is told to work with roughly half the elements, as is the right, and one element is reserved for the value of the tree at this step. The left tree is always created before the right tree, and passes the remaining elements to this right-tree-creation (except one value, which is saved for the current node), in this way the values of the left tree are always less than (i.e. earlier in the list) than the righttree.  

;The way it works specifically is as follows: 
;the method will create 'left-results' until n = 0 and the method returns a null tree and a list full of elements
;the call which made the aformentioned call will create a node with value: car of element list, left branch: null, and right branch: the next value in elements (this will subsequently return becase n=0). Then this call will return its node to the call which called it, with the correct remaining elts. Note that the call which we are now on has it's left node all worked out. This repeats recursively

;Essentially a succession of left branches are created, then one right branch is created, then the left branches for that branch are created until n =0..... until it returns to a node which has its left branch complete ... which subsequently creates its right branch. ... etc etc.

;Tree:
;             5
;           /  \
;          1    9
;          \   / \
;          3  7   11 

;The order of growth of this algorithm is O(n), since it visit every element only once (and what it does every visit is cars and cons and cdrs which are constant in time).
