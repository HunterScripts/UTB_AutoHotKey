#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay, 0
SetDefaultMouseSpeed, 0
SetMouseDelay, 0
SetTitleMatchMode, 2
DetectHiddenWindows, On 

fullScriptPath = C:\Users\Jeff.UTBMANAGEMENT\Desktop\Scripts\
scriptName = none

Gui, Add, Radio, altsubmit gCheck vRadioGroup, New Hire
Gui, Add, Radio, altsubmit gCheck, TaxDepositChecks
Gui, Add, Radio, altsubmit gCheck, JournalEntry
Gui, Add, Radio, altsubmit gCheck, AP CheckRegister
Gui, Add, Radio, altsubmit gCheck, PayrollEnteringDates
Gui, Add, Radio, altsubmit gCheck, PayrollRegisterSheets
Gui, Add, Radio, altsubmit gCheck, TermCodes
Gui, Add, Radio, altsubmit gCheck, PayrollDateChange
Gui, Add, Radio, altsubmit gCheck, TaxSpreadsheetEntry
Gui, Add, Radio, altsubmit gCheck, StoreNumberEntry
Gui, Add, Radio, altsubmit gCheck, RFM
Gui, Add, Radio, altsubmit gCheck, None

Gui, Show, x1760 y425
Return

GuiClose:
ExitApp


Check:
gui, submit, nohide
if (RadioGroup = 1){
	WinClose, %fullScriptPath%%scriptName% ahk_class AutoHotkey
	scriptName = NewHire.ahk
	Run, %fullScriptPath%%scriptName%
}
if (RadioGroup = 2){
	WinClose, %fullScriptPath%%scriptName% ahk_class AutoHotkey
	scriptName = TaxDepositChecks.ahk
	Run, %fullScriptPath%%scriptName%
}
if (RadioGroup = 3){
	WinClose, %fullScriptPath%%scriptName% ahk_class AutoHotkey
	scriptName = JournalEntry.ahk
	Run, %fullScriptPath%%scriptName%
}
if (RadioGroup = 4){
	WinClose, %fullScriptPath%%scriptName% ahk_class AutoHotkey
	scriptName = CheckRegister.ahk
	Run, %fullScriptPath%%scriptName%
}
if (RadioGroup = 5){
	WinClose, %fullScriptPath%%scriptName% ahk_class AutoHotkey
	scriptName = PayrollEntering_EntryDates.ahk
	Run, %fullScriptPath%%scriptName%
}
if (RadioGroup = 6){
	WinClose, %fullScriptPath%%scriptName% ahk_class AutoHotkey
	scriptName = PayrollRegisterSpreadsheets.ahk
	Run, %fullScriptPath%%scriptName%
}
if (RadioGroup = 7){
	WinClose, %fullScriptPath%%scriptName% ahk_class AutoHotkey
	scriptName = TermCodes.ahk
	Run, %fullScriptPath%%scriptName%
}
if (RadioGroup = 8){
	WinClose, %fullScriptPath%%scriptName% ahk_class AutoHotkey
	scriptName = PayrollDateChange.ahk
	Run, %fullScriptPath%%scriptName%
}
if (RadioGroup = 9){
	WinClose, %fullScriptPath%%scriptName% ahk_class AutoHotkey
	scriptName = TaxEntry.ahk
	Run, %fullScriptPath%%scriptName%
}
if (RadioGroup = 10){
	WinClose, %fullScriptPath%%scriptName% ahk_class AutoHotkey
	scriptName = StoreEntering.ahk
	Run, %fullScriptPath%%scriptName%
}
if (RadioGroup = 11){
	WinClose, %fullScriptPath%%scriptName% ahk_class AutoHotkey
	scriptName = RFMScripts.ahk
	Run, %fullScriptPath%%scriptName%
}
if (RadioGroup = 12){
	WinClose, %fullScriptPath%%scriptName% ahk_class AutoHotkey
}
Return
