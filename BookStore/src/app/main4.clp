
(deftemplate person
    (slot name)
	(slot age)
)

(assert (person (name "Justine") (age 17)))
(assert (person (name "Winata") (age 18)))
(assert (person (name "Purwoko") (age 16)))


(
    deffacts insertPerson
    (person (name "Justine Winata") (age 16))
    (person (name "Winata Purwoko") (age 20))
)

(defquery search-by-name
    "Mencari orang berdasarkan nama"
    (declare (variables ?search))
    (person (name ?n) (age ?a))
    (test (eq (str-compare ?n ?search) 0))
    )


(facts)