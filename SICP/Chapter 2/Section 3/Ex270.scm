(load "Huffman.scm")
(load "Ex268.scm")
(load "Ex269.scm")

(define dict '(
	       (A 2)
	       (BOOM 1)
	       (GET 2)
	       (JOB 2)
	       (NA 16)
	       (SHA 3)
	       (YIP 9)
	       (WAH 1)))

(define tree (generate-huffman-tree dict))

(define message '(
		  Get a job
		      Sha na na na na na na na na
		      Get a job
		      Sha na na na na na na na na
		      Wah yip yip yip yip
		      yip yip yip yip yip
		      Sha boom
		      ))

(define encoded-message (encode message tree))

(length encoded-message)

;84 bits with a huffman encoding
;with a fixed-length code, (3 bits / symbol) * (36 symbols) = 108 bits, which is about 20% larger than the huffman encoding.
