#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay, 0
SetDefaultMouseSpeed, 0
SetMouseDelay, 0
SetTitleMatchMode, 2

^!x::

test := "3974"
IfWinExist, %test%
	{
WinGetTitle, Title, A
MsgBox, The active window is "%Title%".
	}

return


^!z::
	send {Tab}
	clipboard = 
	send ^c
	ClipWait 
	loc := clipboard

	send {Down}{Shift}+{tab}{tab}
	clipboard = 
	send ^c
	ClipWait 
	name := clipboard

	send {Down}{Shift}+{tab}{tab}
	clipboard = 
	send ^c
	ClipWait 
	soc := clipboard

	send {tab}{tab}
	clipboard = 
	send ^c
	ClipWait 
	addr := clipboard

	send {Up}{Shift}+{tab}{tab}
	clipboard = 
	send ^c
	ClipWait 
	phone := clipboard

	send {tab}{tab}
	clipboard = 
	send ^c
	ClipWait 
	sdate := clipboard

	send {Down}{Shift}+{tab}{tab}
	clipboard = 
	send ^c
	ClipWait 
	dob := clipboard

	send {Down}{Shift}+{tab}{tab}
	clipboard = 
	send ^c
	ClipWait 
	gen := clipboard

	send {Down}{Shift}+{tab}{tab}
	clipboard = 
	send ^c
	ClipWait 
	nat := clipboard

	send {Down}{Down}{Down}{Shift}+{tab}{tab}
	clipboard = 
	send ^c
	ClipWait 
	pay := clipboard

	send {Shift}+{tab}{Shift}+{tab}{Shift}+{tab}
	send {tab}{tab}{tab}{tab}{tab}{tab}{tab}

	clipboard = 
	send ^c
	ClipWait, 1

	if ErrorLevel
	{
		mar := 1
	} else {
		mar := clipboard
	}
	

	send {tab}
	clipboard = 
	send ^c
	ClipWait 
	tax := clipboard

	send {tab}
	clipboard = 
	send ^c
	ClipWait, 1

	if ErrorLevel
	{
		exempt := 0
	} else {
		exempt := clipboard
	}

	send {tab}
	clipboard = 
	send ^c
	ClipWait 
	addl := clipboard


	StringReplace, empID, soc, -, , All
	StringSplit, address, addr, `r,`n
	StringSplit, namePart, name, `,
	StringSplit, firstName, namePart2, %A_Space%
	StringReplace, phone, phone, (, , All
	StringReplace, phone, phone, )%A_Space%, -, All

	StringReplace, dob, dob, Jan%A_Space%, 01/, All
	StringReplace, dob, dob, Feb%A_Space%, 02/, All
	StringReplace, dob, dob, Mar%A_Space%, 03/, All
	StringReplace, dob, dob, Apr%A_Space%, 04/, All
	StringReplace, dob, dob, May%A_Space%, 05/, All
	StringReplace, dob, dob, Jun%A_Space%, 06/, All
	StringReplace, dob, dob, Jul%A_Space%, 07/, All
	StringReplace, dob, dob, Aug%A_Space%, 08/, All
	StringReplace, dob, dob, Sep%A_Space%, 09/, All
	StringReplace, dob, dob, Oct%A_Space%, 10/, All
	StringReplace, dob, dob, Nov%A_Space%, 11/, All
	StringReplace, dob, dob, Dec%A_Space%, 12/, All
	StringReplace, dob, dob, %A_Space%, /
	StringReplace, dob, dob, `,, , All

	StringSplit, testSpl, address2, %A_Space%

	if (testSpl0 > 3)
	{
		city := testSpl1
		run := testSpl0-3
		Loop, %run%
		{
			ind := a_index + 1
   			city .= " " . testSpl%ind%
		}
	} else {
		city := testSpl1
	}	
	stateNum := testSpl0-1
	state := testSpl%stateNum%
	zip := testSpl%testSpl0%


	if (nat == 1){
nat := "N"
}
	if (nat == 2){
nat := "H"
}
	if (nat == 3){
nat := "A"
}
	if (nat == 4){
nat := "C"
}
	if (nat == 5){
nat := "B"
}
	if (nat == 6){
nat := "P"
}
	if (nat == 7){
nat := "2 OR MORE"
}


	WinActivate, Maintain Employees

	empID = %empID%
	dob = %dob%
	gen = %gen%
	pay = %pay%
	mar = %mar%
	soc = %soc%
	ot := pay * 1.5

	
	send %empID%
	sleep 100
	send {Tab}
	
	clipboard = 
	send ^c
	ClipWait, 2

	if ErrorLevel
	{
		send %firstName2%
		send {TAB 2}
		send %namePart1%
		send {TAB 5}
		send %address1%
		send {TAB 2}
		send %city%
		send {TAB}
		send %state%
		send {TAB}
		send %zip%
		send {TAB}
		send USA
		send {TAB 3}
		send %phone%
		send {TAB 3}
		send %soc%
		send {TAB 1}
		send 650
		send {TAB 2}
		send %dob%
		send {TAB}
		send %nat%
		send {TAB}
		send %gen%

		
		click 110, 176
		send {TAB 12}
		send {DOWN}
		clipboard = 
		send ^c
		ClipWait 
		str := clipboard

		send {TAB 4}
		send %sdate%


		click 184, 183
		send {TAB 3}
		send {DOWN 2}
		send {TAB}
		send 0
		send {TAB 2}
		send %pay%
		send {TAB 2}
		send %ot%

		
		click 256, 180
		click 346, 293
		send {SHIFT}+{TAB}
		IfInString, mar, 2
		{
			send {DOWN}
		}
		send {TAB}
		IfInString, tax, Y
		{
			send 99
		} else {
			send %exempt%
		}
		send {TAB}
		send %addl%
		send {TAB}
		IfInString, mar, 2
		{
			send {DOWN}
		}
		send {TAB}
		send %exempt%
		send {TAB}
		send 0
		send {TAB 2}
		IfInString, mar, 2
		{
			send {DOWN}
		}
		send {TAB}
		send %exempt%
		send {TAB}
		send 0

		click 54, 178

		If (loc <> str)
		{
			Sleep, 500
			MsgBox, Check Store
		}

	} else {
		MsgBox, Exists
		return
	}


return


^!s::
click 54, 178
click 264, 64
return



;variables are: loc, name, soc, addr, phone, sdate, dob, gen, nat, pay, mar, tax, exempt, addl
;window is Maintain Employees