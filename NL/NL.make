#   File:       NL.make
#   Target:     NL
#   Sources:    nlist.aii 
#   Created:    Sunday, April 23, 1989 6:28:50 PM

NL ÄÄ NL.make ¶
		nlist.aii.obj ¶
		TextIO.aii.obj
	LinkIIGS -t CDA ¶
		nlist.aii.obj ¶
		TextIO.aii.obj ¶
		-o NiftyList.CDA
	DuplicateIIGS -mac -y NiftyList.CDA :
nlist.aii.obj Ä NL.make nlist.aii
	AsmIIGS -t nlist.aii
TextIO.aii.obj Ä NL.make TextIO.aii
	AsmIIgs -t TextIO.aii
