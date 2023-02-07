; Template

(printout t "STARTING MAIN2.CLP")
(deftemplate book
    (slot name)
	(slot price)
    (slot type)    
)

; Book
(deffacts initial-books
    (book (name "Justine Winata") (price 10) (type "manga"))
    (book (name "Hello World") (price 10) (type "manga"))
    (book (name "Wiryahadi Gunawan") (price 10) (type "manga"))
    (book (name "Jonathan Raine") (price 10) (type "study"))
    (book (name "Holyvia Marcella") (price 10) (type "study"))
    ) 


(reset)

; Insert
(assert (book (name "Justine") (price 3000) (type "manga")))

; Update
(modify 3 (name "Winata") (price 3000)  (type "manga"))

; Remove
(retract 1)

;(facts)

(defrule print-book
    (print-book-first)
    (book (name ?name) (type ?type))
    (test (eq ?type "Winata"))
    	=>
    (printout t ?name crlf)
)

(assert (print-book-first))

(run)
;; Buat jalanin semua rule
(retract-string "(print-book-first)")
(assert (print-book-first))
(run)
;; (facts)


;; buat rule

(deftemplate recommendation-book
    (slot name)
    (slot price)
    (slot type)
    )

(defrule budget-low
	(b-low)
    (book (name ?name) (price ?price) (type ?type))
    (test (eq ?type "manga"))
    =>
    (assert (recommendation-book (name ?name ) (price ?price) (type ?type)))    
)

(defrule budget-high
	(b-high ?type_)
    (book (name ?name) (price ?price) (type ?type))
    (test (eq ?type ?type_))
    =>
    (assert (recommendation-book (name ?name ) (price ?price) (type ?type)))    
)


(defrule recommendation
	(start-recommendation ?budget ?type)
    =>
    (if (eq ?budget "low")
        then (assert(b-low))
      elif (eq ?budget "high")
        then (assert(b-high ?type))
        )    
)

(printout t "")
(printout t "input budget >> ")
(bind ?budget (readline))

(printout t "input type >>")
(bind ?type (readline))

(assert (start-recommendation ?budget ?type))
(run)
(facts)

(defquery get-recommended-book
    (recommendation-book (name ?name) (price ?price) (type ?type)
	)
)

(reset)
;(run)
(facts)

(new app.Query)


