;;(if (not (neq 10 10))  then (format t "%s%d" "greater than" 10 crlf)
;;	elif (< 1 10) then (printout t "hmm")
;;)
;;(bind ?x (read))
;;(printout t ?x crlf)
;;(printout t ?x crlf)

;;(printout t (str-cat ?x "x"))
;;(printout t (str-compare "x" "x"))
;;(printout t (str-length "abc"))
;;(printout t (str-index "bc" "abc"))
;;(printout t (upcase "abc"))
;;(printout t (lowcase "ABC"))
;;(printout t (++ ?x))
;;(bind ?x 1)
;;(while (< ?x 10)
;;    do (printout t ?x)
;;    (bind ?x (+ ?x 1))    
;;)

;;(deffunction print-x (?x ?y)
;;	"comment"
;;	(printout t ?x ?y crlf)
;;)

;;(print-x 1 2)
(deftemplate book-store
	"comment"
   	(slot name)
    (slot price)
    (slot type)
)

(deftemplate recommended-book
    "comment"
   	(slot name)
    (slot price)
    (slot type)
)

(deffacts insert_book
	"comment"
    (book-store (name "book a") (price 1000) (type "manga"))
    (book-store (name "book b") (price 2000) (type "manga"))
    (book-store (name "book c") (price 3000) (type "manga"))
    (book-store (name "book d") (price 4000) (type "study"))
    (book-store (name "book e") (price 5000) (type "study"))
)

(watch facts)

(do-backward-chaining recommendation)
(defrule book-recommendation
	(recommendation ?req)
    (book-store (name ?name) (price ?price) (type ?type))
    (test (eq ?req ?type))
    =>
    (assert (recommended-book (name ?name) (price ?price) (type ?type)))
)

(defrule do-recommendation
	(need-recommendation ?)
    =>
    (assert (recommendation "manga"))
)

;;(defrule delete-recommendation
;;    ?i <-(delete)
;;    ?x <-(recommendation ?req)
;;    =>
;;    (retract ?i)
;;    (retract ?x)
;;)

(reset)

;;(assert (recommendation "manga"))
;;(run)
;;(assert (delete))
(run)

;;(defquery simple-q
;;    (recommended-book (name ?name) (price ?price) (type ?type))
;;)

;;(new app.Template)

;;(assert (book-store (name "book f") (price 5000) (type "study")))
;;(modify 1 (name "book x") (price 5000) (type "study"))
;;(retract 1)
;;(facts)

;;(defrule book
;;	"comment"
;;    (book-a)
;;    (book-store (name ?name))
;;	=>
;;    (printout t ?name crlf)
;;)

;;(defrule book-1
;;	"comment"
;;    (book-b)
;;    (book-store (name ?name))
;;    (test (or (eq ?name "book a") (eq ?name "book b")))
;;	=>
;;    (printout t ?name crlf)
;;)
;;(assert (book-b))
;;(run)

;;(assert (book-a))
;;(run)