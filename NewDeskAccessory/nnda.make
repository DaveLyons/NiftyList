#   File:       nnda.make
#   Target:     nnda
#   Sources:    NiftyNDA.aii 
#   Created:    Thursday, October 25, 1990 12:18:25 AM

nnda Ä NiftyNDA.aii.obj NiftyNDA.rez
	LinkIIGS -t NDA NiftyNDA.aii.obj -o nNDA
	reziigs NiftyNDA.rez -o nNDA -c pdos -t 'B8  '
	DuplicateIIGS -mac -y nNDA :

NiftyNDA.aii.obj Ä NiftyNDA.aii ::E16.NList
	AsmIIGS -t NiftyNDA.aii
