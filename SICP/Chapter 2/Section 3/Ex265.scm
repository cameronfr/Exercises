(load "Ex263.scm")
(load "Ex264.scm")
(load "Ex262.scm")
(load "OrderedSets.scm")

(define (union-set-tree tree1 tree2)
  (list->tree
   (union-set (tree->list-2 tree1) (tree->list-2 tree2))))

(define (intersection-set-tree tree1 tree2)
  (list->tree
   (intersection-set (tree->list-2 tree1) (tree->list-2 tree2))))

;because list->tree, tree->list-2, union-set, and intersection set are all O(n), the above procedures are also O(n).
