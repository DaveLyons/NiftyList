{
	Sample Nifty List module in MPW IIgs Pascal
	4-Dec-91 Dave Lyons
}

unit PascalSample;

interface

uses
	Types, Memory, MiscTool, NiftyList;

{$Z+} { Export these procedures and functions. These are in the assembly file. }
function NDAOpen: ptr;
procedure NDAAction(Code: Integer; Param: Longint);
{$Z-}

implementation

const
	numCommandsPlusTwo = 4; { first one is special }

type
	commandTableType = array[1..numCommandsPlusTwo] of
		record
			cmdName: ptr; { to Pascal string }
			cmdProc: procPtr;
			helpProc: procPtr;
		end;

	Str128 = String[128];
  
var
	InfoRec: ModuleInfoType;
	myCommandTable: commandTableType;
	TestText: String[40];
	d: longint; { dummy }
	moduleName, commandName1, commandName2: String[32];

function NLService(param: univ longint; code: integer): longint;
begin
	{ dummy function -- first four bytes get patched at runtime to
                        jump into Nifty List }
end;

procedure DisplayLine(theText: Str128);
begin
	d := NLService(@theText,nlWriteSTr);
	d := NLService(nil,nlCrout);
end;


procedure helpModule;
begin
	DisplayLine('Pascal Sample 1.0:');
	DisplayLine('  \pascal1     \pascal2');
end;

procedure help1;
begin
	DisplayLine('\pascal1 -- This is the help for the \pascal1 command.');
end;

procedure command1;
begin
	DisplayLine('This is the pascal1 command.');
end;

procedure help2;
begin
	DisplayLine('\pascal2 -- This is the help for the \pascal2 command.');
end;

procedure command2;
begin
	DisplayLine('This is the pascal2 command.');
end;


function NDAOpen: ptr;
begin
	{ First entry is for the module itself }
	moduleName := 'Sample Pascal module #1';
	with myCommandTable[1] do begin
		cmdName := @moduleName;
		cmdProc := nil;
		helpProc := @helpModule; { displays command summary }
	end;
	commandName1 := 'pascal1';
	with myCommandTable[2] do begin
 		cmdName := @commandName1;
		cmdProc := @command1;
		helpProc := @help1;
	end;
	commandName2 := 'pascal2';
	with myCommandTable[3] do begin
		cmdName := @commandName2;
		cmdProc := @command2;
		helpProc := @help2;
	end;
	{ Last entry terminates list by having NIL for command name }
	with myCommandTable[4] do begin
		cmdName := nil;
	end;

	with InfoRec do begin
		size := sizeof(InfoRec);
    	format := 0;
    	patchType := 0;
    	patch := @NLService;
		bytesPerCommand := 12;
		cmdTable := @myCommandTable[1];
	end;
	NDAOpen := @InfoRec;
end;

procedure NDAAction(Code: Integer; Param: Longint);
begin
	case Code of
	    { THIS IS JUST AN EXAMPLE...Actually, it's a *bad* idea to
		  display messages from your module on the way into and out
		  of Nifty List.  If you *do*, then be sure *not* to call
		  nlCrout, because that'll let them abort to the command
		  line, which might crash.
		}
		actEnterNL: begin
			DisplayLine('Greetings from Pascal Sample!');
		end;
		actExitNL: begin
			DisplayLine('Goodbye from Pascal Sample!');
			SysBeep;
		end;
	end; { case }
end;

end.
