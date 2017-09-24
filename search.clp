(defrule simple-search
	(or (person (username ?name) (gender female) (hair blond))
		(person (username ?name) (gender male) (income ?income&:(> ?income 5)))
	)
	=>
	(printout t	?name crlf)
	
)