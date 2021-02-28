{********************************************
;
; File: NiftyList.p for Nifty List 3.4
; by Dave Lyons, 4-Dec-91
;
; Last revision: 4-Dec-91 DAL
;
********************************************}

UNIT NiftyList;

	INTERFACE

		USES TYPES;

		CONST
			{ Action codes }
			actBirth = 1;
			actDeath = 2;
			actEnterNL = 3;
			actExitNL = 4;

			{ --- Nifty List service codes --- }

			{ Environment services }
			nlRecover = $00; { for debugging only }
			nlEnter = $01;
			nlRemoveNL = $02;
			nlGetInfo = $03;
			nlInstallHook = $04;
			nlRemoveHook = $05;
			nlGetDirectory = $06;
			nlNewSession = $07; { for 3.1 }
			nlKillSession = $08; { for 3.1 }
			nlSetSession = $09; { for 3.1 }
			nlWelcome = $0A; { for 3.1 }
			nlLoadStuff = $0B; { for 3.1 }
			nlGetTextState = $0C; { for 3.3 }
			nlSetTextState = $0D; { for 3.3 }

			{ Information services }
			nlGetFirstHandle = $10;
			nlGetHandleInfo = $11;
			nlLookup = $12;
			nlIndLookup = $13;
			nlGetProcName = $14; { for 3.1 }
			nlClassifyAddr = $15; { for 3.3 }

			{ Utility services }
			nlScanHandles = $20;
			nlDisasm1 = $21; { for 3.2 }
			nlExecCmdLine = $22; { for 3.1 }
			nlGetRange = $23;
			nlGetAGlobal = $24;
			nlSetAGlobal = $25;
			nlAbortToCmd = $26;

			{ Input/Output services }
			nlWriteChar = $30;
			nlShowChar = $31;
			nlWriteStr = $32;
			nlShowStr = $33;
			nlWriteCStr = $34;
			nlShowCStr = $35;
			nlWriteText = $36;
			nlShowText = $37;
			nlWriteByte = $38;
			nlWriteWord = $39;
			nlWritePtr = $3A;
			nlWriteLong = $3B;
			nlGetLn = $3C;
			nlGetChar = $3D;
			nlCheckKey = $3E;
			nlCrout = $3F;
			nlSpout = $40;
			nlPause = $41;
			nlHandleInfo = $42;
			nlWriteNoVoice = $43;
			nlShowWString = $44;

			{ Command-parsing services }
			nlChrGet = $50;
			nlChrGot = $51;
			nlEatBlanks = $52;
			nlEvalExpr = $54;

			{ Memory-access services }
			nlGetByte = $60;
			nlGetWord = $61;
			nlGetLong = $62;

			{ callback selectors used inside nlExecCmdLine }
			{ trying to write a session callback handler in
			  Pascal is disrecommended }
			cbWrite = $00;
			cbWriteC = $02;
			cbFlush = $04;
			cbGetKey = $06;
			cbChkAbort = $08;
			cbAbort = $0A;
			cbGetString = $0C;
			cbFunWindow = $0E;
			cbDeath = $10;

			{ nlGetAGlobal/nlSetAGlobal reference numbers }
			nlgNUM1 = $01;
			nlgADDR = $02;
			nlgInfoTable = $03; { for 3.3 }

			{ Data file section numbers }
			nlSecP8 = 0; { ProDOS 8 section }
			nlSecP16 = 1; { P16,GS/OS,Shell section }
			nlSecSysTool = 2; { System Tools section }
			nlSecUserTool = 3; { User Tools section }
			nlSecE1vec = 4; { E1xxxx vector section }
			nlSecE0vec = 5; { E0xxxx vector section }
			nlSecF8andSS = 6; { softswitch & F8 ROM section }
			nlSec01vec = 7; { 01xxxx vector section }
			nlSecNLService = 8; { Nifty List service calls section }
			nlSecResTypes = 9; { resource type names }
			nlSecErrors = 10; { OS and toolbox error codes }
			nlSecHyperCard = 11; { HyperCardIIGS callback names (for NL 3.2) }
			nlSecReqCode = 12; { SendRequest codes (for 3.4) }

		TYPE
			ModuleInfoType = RECORD
									  size: integer;
									  format: integer;
									  patchType: integer;
									  patch: procptr;
									  bytesPerCommand: integer;
									  cmdTable: ptr;
								  END;

			EvalExprBuffer = RECORD
									  maxExprSize: integer;
									  actExprSize: integer;
									  expr: PACKED ARRAY [1..512] OF char;
								  END;

			GetRangeBuffer = RECORD
									  rangeStart: longint;
									  rangeEnd: longint;
									  rawStart: longint;
									  rawEnd: longint;
								  END;

	IMPLEMENTATION

END.
