; Print Dasar Dengan Format
(printout t "Hello World" crlf)
(format t "%s %d" "hello world" 1)
(printout t crlf)

; Bind
(bind ?str(readline))
(bind ?num (read))

; Print Variable
(printout t ?str)
(printout t crlf)
(printout t ?num)

; Kasih Variable
(bind ?new_bum 100)

; Equals
(printout t (eq 10 10) crlf)
(printout t (neq 10 10) crlf)

; OR 
(printout t (or (< 1  10) (> 1 10)) crlf)

;


;If Else
(if (< 1 10)
    then (printout t "true" crlf)
elif (eq 10 10)
	then (printout t "10 = 10" crlf)
else
    (printout t "else" crlf)        
) 

; Function

(deffunction sum (?x ?y)
    	"comment"
    	return (+ ?x ?y)
)

(printout t (sum 10 10))

