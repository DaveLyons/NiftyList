#   File:       goodies.make
#   Target:     goodies
#   Sources:    goodies.aii 
#   Created:    Friday, November 24, 1989 9:18:45 PM

Goodies Ä ¶
		goodies.aii.obj
	LinkIIGS goodies.aii.obj -o goodies -at $4001 -t $bc
	DuplicateIIGS -y -mac goodies :
goodies.aii.obj Ä goodies.aii
	AsmIIGS -t goodies.aii
