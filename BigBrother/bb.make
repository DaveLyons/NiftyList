#   File:       bb.make
#   Target:     bb
#   Sources:    bb.aii

bb � �
		bb.aii.obj
	LinkIIGS bb.aii.obj -o bb -at $4001 -t $bc
	DuplicateIIGS -y -mac bb :
bb.aii.obj � bb.aii
	AsmIIGS bb.aii
