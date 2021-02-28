#   File:       bb.make
#   Target:     bb
#   Sources:    bb.aii

bb Ä ¶
		bb.aii.obj
	LinkIIGS bb.aii.obj -o bb -at $4001 -t $bc
	DuplicateIIGS -y -mac bb :
bb.aii.obj Ä bb.aii
	AsmIIGS bb.aii
