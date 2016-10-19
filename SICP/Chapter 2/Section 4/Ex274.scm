(define (put key1 key2 func) (2d-put! key1 key2 func))
(define (get key1 key2) (2d-get key1 key2))


(define (get-employee-record employee file)
  ((get 'get-employee-record (file-structure file))
   employee (file-contents file)))

(define (get-employee-salary record)
  ((get 'get-employee-salary (record-structure record))
   (record-contents record)))

(define (find-employee-record employee files)
  (if
   ((null? files) (error "ERROR: employee not found " employee))
   (let ((result (get-employee-record employee (car files))))
     (if (null? result)
	 (find-employee-record employee (cdr files))
	 result
	 ))))

(define (file-structure file)
  (car file))

(define (record-structure record)
  (car record))

(define (file-contents file)
  (cadr file))

(define (record-contents record)
  (cadr record))

;Data-type specific implementations

(define (install-tree-methods)
  (define (get-employee-record-tree employee file)
    ;search tree for employee record .....
    )
  (define (get-employee-salary-tree record)
    ;get salary from tree-structured record
    )
  (put 'get-employee-record 'tree get-employee-record-tree)
  (put 'get-employee-salary 'tree get-employe-salary-tree)
  'done)

(define (install-list-methods)
  (define (get-employee-record-list employee file)
    ;search list for employee record.....    
    )
  (define (get-employe-salary-list record)
    ;get salary from list-structured record
    )
  (put 'get-employee-record 'list get-employee-record-list)
  (put 'get-employee-salary 'list get-employe-salary-list)
  'done)

;1. The division files much be structured, in general, containing a symbol representing the structure of the file and then the contents of the file itself. Here the assumption is that the file is a list with a symbol representing the structure and the actual structure.

;2. Each record similarly should be a list with a symbol representing the structure of the record and the contents of the record itself.

;4. When more files are added, the structure of the file must be adjoined to the actual file itself, and similarly the structure of each record must be adjoined to the record itself. This could be a list with the structure and the actual data. Also, the data-type specific implementations of get-employee-records and get-employee-salary must be implemented.
