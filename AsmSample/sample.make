#   File:       sample.make
#   Target:     sample
#   Sources:    sample.aii 
#   Created:    Friday, November 24, 1989 9:18:45 PM

sample Ä ¶
		sample.aii.obj
	LinkIIGS sample.aii.obj -o sample -at $4001 -t $bc
	DuplicateIIGS -y -mac sample :
sample.aii.obj Ä sample.aii
	AsmIIGS -t sample.aii
