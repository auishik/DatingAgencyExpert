(defrule matching-rule
	(initial-fact)
	=>
	(printout t "Date search" crlf)
	(printout t "Your name:" crlf)
	(bind ?username (read))
	(printout t "Maximum age:" crlf)
	(bind ?age_u (read))
	(printout t "Minimum age:" crlf)
	(bind ?age_l (read))
	(printout t "Gender :" crlf)
	(bind ?gender (read))
	(printout t "Hair :" crlf)
	(bind ?hair (read))
	(printout t "Eyes :" crlf)
	(bind ?eyes (read))
	(printout t "Occupation :" crlf)
	(bind ?occupation (read))
	(printout t "Hobbies :" crlf)
	(bind ?hobbies (read))
	(printout t "Personality :" crlf)
	(bind ?personality (read))
	(printout t "Maximum Income :" crlf)
	(bind ?income_u (read))
	(printout t "Minimum Income :" crlf)
	(bind ?income_l (read))
	(printout t "Location :" crlf)
	(bind ?location (read))
	(printout t "Maximum Height :" crlf)
	(bind ?height_u (read))
	(printout t "Minimum Height :" crlf)
	(bind ?height_l (read))
	(printout t "Religion :" crlf)
	(bind ?religion (read))
	(assert (match-criteria
				(username ?username)
				(age_u ?age_u)
				(age_l ?age_l)
				(gender ?gender)
				(hair ?hair)
				(eyes ?eyes)
				(occupation ?occupation)
				(hobbies ?hobbies)
				(personality ?personality)
				(income_u ?income_u)
				(income_l ?income_l)
				(location ?location)
				(height_u ?height_u)
				(height_l ?height_l)
				(religion ?religion)
			)
	)
)

(defrule match-gen-age
	?fact <- (match (username ?username) (poll ?poll))
	(match-criteria (age_u ?age_u))
	(match-criteria (age_l ?age_l))
	?person <- (person (username ?username) (age ?age))
	(test (> ?age ?age_l))
	(test (< ?age ?age_u))
	=>
	(modify ?fact (poll (+ ?poll 1)))
	(modify ?person (age 0))
)

(defrule match-gen-income
	(match (username ?username) (poll ?poll))
	?fact <- (match (username ?username) (poll ?poll))
	(match-criteria (income_u ?income_u))
	(match-criteria (income_l ?income_l))
	?person <- (person (username ?username) (income ?income))
	(test (> ?income ?income_l))
	(test (< ?income ?income_u))
	=>
	(modify ?fact (poll (+ ?poll 1)))
	(modify ?person (income 0))
)

(defrule match-gen-height
	(match (username ?username) (poll ?poll))
	?fact <- (match (username ?username) (poll ?poll))
	(match-criteria (height_u ?height_u))
	(match-criteria (height_l ?height_l))
	?person <- (person (username ?username) (height ?height))
	(test (> ?height ?height_l))
	(test (< ?height ?height_u))
	=>
	(modify ?fact (poll (+ ?poll 1)))
	(modify ?person (height 1.0))
)

(defrule match-gen-gender
	(match (username ?username) (poll ?poll))
	?fact <- (match (username ?username) (poll ?poll))
	(match-criteria (gender ?gender))
	?person <- (person (username ?username) (gender ?gender))
	=>
	(modify ?fact (poll (+ ?poll 1)))
	(modify ?person (gender na))
)

(defrule match-gen-hair
	(match (username ?username) (poll ?poll))
	?fact <- (match (username ?username) (poll ?poll))
	(match-criteria (hair ?hair))
	?person <- (person (username ?username) (hair ?hair))
	=>
	(modify ?fact (poll (+ ?poll 1)))
	(modify ?person (hair na))
)

(defrule match-gen-eyes
	(match (username ?username) (poll ?poll))
	?fact <- (match (username ?username) (poll ?poll))
	(match-criteria (eyes ?eyes))
	?person <- (person (username ?username) (eyes ?eyes))
	=>
	(modify ?fact (poll (+ ?poll 1)))
	(modify ?person (eyes na))
)

(defrule match-gen-occupation
	(match (username ?username) (poll ?poll))
	?fact <- (match (username ?username) (poll ?poll))
	(match-criteria (occupation ?occupation))
	?person <- (person (username ?username) (occupation ?occupation))
	=>
	(modify ?fact (poll (+ ?poll 1)))
	(modify ?person (occupation na))
)

(defrule match-gen-hobbies
	(match (username ?username) (poll ?poll))
	?fact <- (match (username ?username) (poll ?poll))
	(match-criteria (hobbies ?hobbies))
	?person <- (person (username ?username) (hobbies ?hobbies))
	=>
	(modify ?fact (poll (+ ?poll 1)))
	(modify ?person (hobbies na))
)

(defrule match-gen-personality
	(match (username ?username) (poll ?poll))
	?fact <- (match (username ?username) (poll ?poll))
	(match-criteria (personality ?personality))
	?person <- (person (username ?username) (personality ?personality))
	=>
	(modify ?fact (poll (+ ?poll 1)))
	(modify ?person (personality na))
)

(defrule match-gen-location
	(match (username ?username) (poll ?poll))
	?fact <- (match (username ?username) (poll ?poll))
	(match-criteria (location ?location))
	?person <- (person (username ?username) (location ?location))
	=>
	(modify ?fact (poll (+ ?poll 1)))
	(modify ?person (location na))
)

(defrule match-gen-religion
	?fact <- (match (username ?username) (poll ?poll))
	(match (username ?username) (poll ?poll))
	(match-criteria (religion ?religion))
	?person <- (person (username ?username) (religion ?religion))
	=>
	(modify ?fact (poll (+ ?poll 1)))
	(modify ?person (religion na))
)

(defrule match-gen
	(match-criteria (username ?for))
	(person (username ?username&~?for))
	=>
	(assert (match (username ?username) (poll 0)))
)

;deffunction print-dates ( )
;	(bind ?poll 11)
;	(while (> ?poll 0)
;		(bind $?list (find-fact ((?match match)) (eq ?match:poll ?poll)))
;		(loop-for-count (?count 1 (length ?list)) do 
;			(printout t "Username : " (fact-slot-value (nth$ ?count ?list) username) crlf)
;		)
;		(- ?poll 1)
;	)
;)

(deffunction print-dates ( )
	(bind ?poll 11)
	(while (> ?poll 0)
		(do-for-all-facts ((?match match)) (eq ?match:poll ?poll)
			(printout t ?match:username crlf)
		)
		(bind ?poll (+ ?poll -1))
	)
)