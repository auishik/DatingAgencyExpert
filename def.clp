(deftemplate person
	(slot username (type SYMBOL))
	(slot age (type INTEGER) (default 0))
	(slot gender (type SYMBOL) (allowed-values male female na) (default na))
	(slot hair (type SYMBOL) (allowed-values blond brown black red na) (default na))
	(slot eyes (type SYMBOL) (allowed-values brown black blue green na) (default na))
	(slot occupation (type SYMBOL) (allowed-values banker teacher actor musician athlete student na) (default na))
	(multislot hobbies (type SYMBOL) (allowed-values gardening swimming sports hiking reading dancing singing na) (default na))
	(slot personality (type SYMBOL) (allowed-values relaxed calm boring hyper extrovert introvert na) (default na))
	(slot income (type INTEGER) (range 0 10) (default 0))
	(slot location (type SYMBOL) (allowed-values CA DC FL na) (default na))
	(slot height (type FLOAT) (range 1.0 ?VARIABLE) (default 1.0))
	(slot religion (type SYMBOL) (allowed-values islam hinduism christianity budhism na) (default na))
)

(deftemplate match-criteria
	(slot username (type SYMBOL))
	(slot age_u (type INTEGER))
	(slot age_l (type INTEGER))
	(slot gender (type SYMBOL))
	(slot hair (type SYMBOL))
	(slot eyes (type SYMBOL))
	(slot occupation (type SYMBOL))
	(multislot hobbies (type SYMBOL))
	(slot personality (type SYMBOL))
	(slot income_u (type INTEGER))
	(slot income_l (type INTEGER))
	(slot location (type SYMBOL))
	(slot height_u (type FLOAT))
	(slot height_l (type FLOAT))
	(slot religion (type SYMBOL))
)

(deftemplate match
	(slot username (type SYMBOL))
	(slot poll (type INTEGER))
)

(deffacts people
	(person
		(username John)
		(age 27)
		(gender male)
		(hair brown)
		(eyes brown)
		(occupation teacher)
		(hobbies reading)
		(personality calm)
		(income 6)
		(location CA)
		(height 5.2)
		(religion islam)
	)
	(person
		(username Mary)
		(age 25)
		(gender female)
		(hair blond)
		(eyes brown)
		(occupation banker)
		(hobbies reading)
		(personality relaxed)
		(income 6)
		(location CA)
		(height 5.1)
		(religion islam)
	)
	(person
		(username Rick)
		(age 24)
		(gender male)
		(hair black)
		(eyes blue)
		(occupation student)
		(hobbies sports)
		(personality hyper)
		(income 4)
		(location DC)
		(height 5.7)
		(religion christianity)
	)
	(person
		(username Lora)
		(age 24)
		(gender female)
		(hair red)
		(eyes blue)
		(occupation student)
		(hobbies sports dancing)
		(personality relaxed)
		(income 4)
		(location DC)
		(height 5.4)
		(religion christianity)
	)
	(person
		(username Richard)
		(age 22)
		(gender male)
		(hair red)
		(eyes green)
		(occupation student)
		(hobbies sports dancing)
		(personality hyper)
		(income 4)
		(location FL)
		(height 5.7)
		(religion hinduism)
	)
	(person
		(username Sara)
		(age 22)
		(gender female)
		(hair brown)
		(eyes blue)
		(occupation student)
		(hobbies dancing)
		(personality boring)
		(income 4)
		(location FL)
		(height 5.8)
		(religion budhism)
	)
	(person
		(username Carl)
		(age 32)
		(gender male)
		(hair brown)
		(eyes brown)
		(occupation musician)
		(hobbies singing swimming)
		(personality relaxed)
		(income 6)
		(location DC)
		(height 5.7)
		(religion budhism)
	)
	(person
		(username Maru)
		(age 30)
		(gender female)
		(hair red)
		(eyes green)
		(occupation actor)
		(hobbies sports dancing)
		(personality hyper)
		(income 8)
		(location CA)
		(height 5.9)
		(religion hinduism)
	)
	(person
		(username Dany)
		(age 25)
		(gender male)
		(hair blond)
		(eyes blue)
		(occupation student)
		(hobbies reading singing)
		(personality relaxed)
		(income 4)
		(location CA)
		(height 5.9)
		(religion islam)
	)
	(person
		(username Hira)
		(age 26)
		(gender female)
		(hair black)
		(eyes black)
		(occupation student)
		(hobbies reading gardening)
		(personality relaxed)
		(income 4)
		(location CA)
		(height 5.9)
		(religion islam)
	)
	
	(person
		(username Kamal)
		(age 25)
		(gender male)
		(hair black)
		(eyes black)
		(occupation actor)
		(hobbies reading dancing singing)
		(personality extrovert)
		(income 8)
		(location FL)
		(height 6.1)
		(religion christianity)
	)
	(person
		(username Alisha)
		(age 26)
		(gender female)
		(hair brown)
		(eyes black)
		(occupation teacher)
		(hobbies reading singing)
		(personality relaxed)
		(income 6)
		(location FL)
		(height 5.0)
		(religion christianity)
	)
	(person
		(username Karim)
		(age 25)
		(gender male)
		(hair brown)
		(eyes green)
		(occupation student)
		(hobbies sports swimming)
		(personality relaxed)
		(income 5)
		(location DC)
		(height 5.8)
		(religion islam)
	)
	(person
		(username Ruhi)
		(age 23)
		(gender female)
		(hair brown)
		(eyes brown)
		(occupation student)
		(hobbies dancing)
		(personality hyper)
		(income 3)
		(location DC)
		(height 5.5)
		(religion budhism)
	)
	(person
		(username Himel)
		(age 24)
		(gender male)
		(hair black)
		(eyes black)
		(occupation student)
		(hobbies sports)
		(personality extrovert)
		(income 4)
		(location FL)
		(height 5.9)
		(religion christianity)
	)
	(person
		(username Shima)
		(age 23)
		(gender female)
		(hair brown)
		(eyes green)
		(occupation student)
		(hobbies sports)
		(personality hyper)
		(income 5)
		(location FL)
		(height 5.8)
		(religion hinduism)
	)
	(person
		(username Jamal)
		(age 31)
		(gender male)
		(hair black)
		(eyes brown)
		(occupation actor)
		(hobbies swimming)
		(personality extrovert)
		(income 9)
		(location CA)
		(height 5.9)
		(religion budhism)
	)
	(person
		(username Lia)
		(age 31)
		(gender female)
		(hair brown)
		(eyes black)
		(occupation musician)
		(hobbies singing reading)
		(personality introvert)
		(income 7)
		(location CA)
		(height 5.7)
		(religion islam)
	)
	(person
		(username Gabriel)
		(age 24)
		(gender male)
		(hair blond)
		(eyes blue)
		(occupation athlete)
		(hobbies sports swimming)
		(personality introvert)
		(income 5)
		(location FL)
		(height 5.9)
		(religion islam)
	)
	(person
		(username Nowreen)
		(age 24)
		(gender female)
		(hair black)
		(eyes black)
		(occupation athlete)
		(hobbies gardening)
		(personality calm)
		(income 5)
		(location CA)
		(height 5.9)
		(religion budhism)
	)
)