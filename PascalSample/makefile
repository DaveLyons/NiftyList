#
# Sample MPW makefile for a Nifty List module
# written in MPW IIgs Pascal
#
# by Dave Lyons, 4-Dec-91
#

module = PascalSample

{module} Ä {module}.p.obj TheHeader.aii.obj
	LinkIIGS TheHeader.aii.obj {module}.p.obj ¶
		-lib "{PIIGSLibraries}"PLib ¶
		-o {module} ¶
		-t $BC -at $4001
	DuplicateIIGS -mac -y {module} :

.p.obj Ä .p
	PascalIIGS {default}.p

.aii.obj Ä .aii
	asmiigs {default}.aii
