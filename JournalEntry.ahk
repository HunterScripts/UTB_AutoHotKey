#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay, 0
SetDefaultMouseSpeed, 0
SetMouseDelay, 0
SetTitleMatchMode, 2

^!z::
	Xl := ComObjActive("Excel.Application") 
	Cell := XL.ActiveCell

	sa := XL.Range("D2").Value
	sb := XL.Range("D3").Value
	sc := XL.Range("D4").Value
	sv := XL.Range("D5").Text
	svt := XL.Range("D6").Text

	management := 0
	hourly := 0
	overtime := 0
	sick := 0
	vacation := 0
	if (sa = "Salary")
	{
		management := XL.Range("F2").Value
	}
	if (sa = "Vacation")
	{
		sick := XL.Range("F2").Value
	}
	if (sa = "Regular")
	{
		hourly := XL.Range("F2").Value
	}
	if (sa = "Overtime")
	{
		overtime := XL.Range("F2").Value
	}
	if (sb = "Regular")
	{
		hourly := XL.Range("F3").Value
	}
	if (sb = "Vacation")
	{
		sick := XL.Range("F3").Value
	}
	if (sb = "Overtime")
	{
		overtime := XL.Range("F3").Value
	}
	if (sc = "Vacation")
	{
		sick := XL.Range("F4").Value
	}
	if (sc = "Overtime")
	{
		overtime := XL.Range("F4").Value
	}
	if (sc = "Regular")
	{
		hourly := XL.Range("F4").Value
	}
	if (sc = "Sick_Use")
	{
		sick := XL.Range("F4").Value
	}
	if (sc = "PTO_Use")
	{
		vacation := XL.Range("F4").Value
	}
	if (sv = "Sick_Use")
	{
		sick := XL.Range("F5").Value
	}
	if (sv = "Vacation")
	{
		sick := XL.Range("F5").Value
	}
	if (sv = "PTO_Use")
	{
		vacation := XL.Range("F5").Value
	}
	if (sV = "Overtime")
	{
		overtime := XL.Range("F5").Value
	}
	if (sV = "Regular")
	{
		hourly := XL.Range("F5").Value
	}
	if (svt = "PTO_Use")
	{
		vacation := XL.Range("F6").Value
	}
	if (svt = "Vacation")
	{
		sick := XL.Range("F6").Value
	}
	if (svt = "Sick_Use")
	{
		sick := XL.Range("F6").Value
	}
	
	net := XL.Range("G2").Value
	fed := XL.Range("I2").Value
	fica := XL.Range("J2").Value
	fica2 := fica * 2
	medicare := XL.Range("K2").Value
	medicare2 := medicare * 2
	state := XL.Range("L2").Value
	insurance := XL.Range("M2").Value
	insurance2 := XL.Range("Y2").Value
	garnishment := XL.Range("N2").Value
	loan := XL.Range("O2").Value
	hrly := XL.Range("S2").Value
	sal := XL.Range("T2").Value
	k := XL.Range("Q2").Value
	futa := XL.Range("AB2").Value
	tri := XL.Range("AC2").Value
	suta := XL.Range("AD2").Value

	if (net = "")
	{
		net := 0
	}
	if (fed = "")
	{
		fed := 0
	}
	if (fica = "")
	{
		fica := 0
	}
	if (fica2 = "")
	{
		fica2 := 0
	}
	if (medicare = "")
	{
		medicare := 0
	}
	if (medicare2 = "")
	{
		medicare2 := 0
	}
	if (state = "")
	{
		state := 0
	}
	if (insurance = "")
	{
		insurance := 0
	}
	if (insurance2 = "")
	{
		insurance2 := 0
	}
	if (garnishment = "")
	{
		garnishment := 0
	}
	if (loan = "")
	{
		loan := 0
	}
	if (hrly = "")
	{
		hrly := 0
	}
	if (sal = "")
	{
		sal := 0
	}
	if (k = "")
	{
		k := 0
	}
	if (futa = "")
	{
		futa := 0
	}
	if (tri = "")
	{
		tri := 0
	}
	if (suta = "")
	{
		suta := 0
	}

	insurance := insurance + insurance2

	Transform, net, Abs, net
	Transform, fed, Abs, fed
	Transform, fica, Abs, fica
	Transform, fica2, Abs, fica2
	Transform, medicare, Abs, medicare
	Transform, medicare2, Abs, medicare2
	Transform, state, Abs, state
	Transform, insurance, Abs, insurance
	Transform, garnishment, Abs, garnishment
	Transform, loan, Abs, loan
	Transform, hrly, Abs, hrly
	Transform, sal, Abs, sal
	Transform, k, Abs, k
	Transform, futa, Abs, futa
	Transform, tri, Abs, tri
	Transform, suta, Abs, suta

	DifStore := 0
	send {Tab}
	clipboard = 
	send ^c
	ClipWait 
	FirstEntry := clipboard

	StringReplace, Store, FirstEntry, MANAGEMENT, , All
	SEND {SHIFT}+{TAB}
		
	while (DifStore = 0)
	{

		SEND {TAB}
		clipboard = 
		send ^c
		ClipWait 
		CurrentEntry := clipboard

		CurrentEntry := clipboard

		IfInString, CurrentEntry, %Store%
		{
			StringReplace, EntryType, CurrentEntry, %Store%, , ALL

		if (EntryType = "MANAGEMENT")
		{
			SEND {TAB}
			SEND %management%
			SEND {TAB 3}
		}
		if (EntryType = "HOURLY")
		{
			SEND {TAB}
			SEND %hourly%
			SEND {TAB 3}
		}
		if (EntryType = "OVERTIME")
		{
			SEND {TAB}
			SEND %overtime%
			SEND {TAB 3}
		}
		if (EntryType = "SICK USE")
		{
			SEND {TAB}
			SEND %sick%
			SEND {TAB 3}
		}
		if (EntryType = "SICK_USE")
		{
			SEND {TAB}
			SEND %sick%
			SEND {TAB 3}
		}
		if (EntryType = "VACATION")
		{
			SEND {TAB}
			SEND %vacation%
			SEND {TAB 3}
		}
		if (EntryType = "NET")
		{
			SEND {TAB 2}
			SEND %net%
			SEND {TAB 2}
		}
		if (EntryType = "FEDERAL")
		{
			SEND {TAB 2}
			SEND %fed%
			SEND {TAB 2}
		}
		if (EntryType = "FICA")
		{
			SEND {TAB}
			SEND %fica%
			SEND {TAB 3}
		}
		if (EntryType = "FICA EMPLOYER 2X ABOVE")
		{
			SEND {TAB 2}
			SEND %fica2%
			SEND {TAB 2}
		}
		if (EntryType = "FICA ACCRUE 2X ABOVE")
		{
			SEND {TAB 2}
			SEND %fica2%
			SEND {TAB 2}
		}
		if (EntryType = "MEDICARE")
		{
			SEND {TAB}
			SEND %medicare%
			SEND {TAB 3}
		}
		if (EntryType = "MEDICARE ")
		{
			SEND {TAB}
			SEND %medicare%
			SEND {TAB 3}
		}
		if (EntryType = "MEDICARE EMPLOYER 2X ABOVE")
		{
			SEND {TAB 2}
			SEND %medicare2%
			SEND {TAB 2}
		}
		if (EntryType = "MEDICARE EMPLOYER 2X ABOVE ")
		{
			SEND {TAB 2}
			SEND %medicare2%
			SEND {TAB 2}
		}
		if (EntryType = "MEDICARE 2X ABOVE")
		{
			SEND {TAB 2}
			SEND %medicare2%
			SEND {TAB 2}
		}
		if (EntryType = "MEDICARE ACCRUE 2X ABOVE")
		{
			SEND {TAB 2}
			SEND %medicare2%
			SEND {TAB 2}
		}
		if (EntryType = "STATE")
		{
			SEND {TAB 2}
			SEND %state%
			SEND {TAB 2}
		}
		if (EntryType = "INSURANCE REIMBURSEMENT")
		{
			SEND {TAB 2}
			SEND %insurance%
			SEND {TAB 2}
		}
		if (EntryType = "INSURANCE REIMBURSE")
		{
			SEND {TAB 2}
			SEND %insurance%
			SEND {TAB 2}
		}
		if (EntryType = "INSURANCE REIMBURE")
		{
			SEND {TAB 2}
			SEND %insurance%
			SEND {TAB 2}
		}
		if (EntryType = "GARNISHMENT")
		{
			SEND {TAB 2}
			SEND %garnishment%
			SEND {TAB 2}
		}
		if (EntryType = "LOAN REPAY")
		{
			SEND {TAB 2}
			SEND %loan%
			SEND {TAB 2}
		}
		if (EntryType = "WBF HRLY ACCRUE")
		{
			SEND {TAB 2}
			SEND %hrly%
			SEND {TAB 2}
		}
		if (EntryType = "WBF HRLY")
		{
			SEND {TAB 2}
			SEND %hrly%
			SEND {TAB 2}
		}
		if (EntryType = "WBF HOURLY ACCRUE")
		{
			SEND {TAB 2}
			SEND %hrly%
			SEND {TAB 2}
		}
		if (EntryType = "WBF HOURLY")
		{
			SEND {TAB 2}
			SEND %hrly%
			SEND {TAB 2}
		}
		if (EntryType = "WBF SAL ACCRUE")
		{
			SEND {TAB 2}
			SEND %sal%
			SEND {TAB 2}
		}
		if (EntryType = "WBF SALARY ACCRUE")
		{
			SEND {TAB 2}
			SEND %sal%
			SEND {TAB 2}
		}
		if (EntryType = "WBF SALARY")
		{
			SEND {TAB 2}
			SEND %sal%
			SEND {TAB 2}
		}
		if (EntryType = "WBF SAL")
		{
			SEND {TAB 2}
			SEND %sal%
			SEND {TAB 2}
		}
		if (EntryType = "401K")
		{
			SEND {TAB 2}
			SEND %k%
			SEND {TAB 2}
		}
		if (EntryType = "FUTA")
		{
			SEND {TAB}
			SEND %futa%
			SEND {TAB 3}
		}
		if (EntryType = "FUTA ACCRUE")
		{
			SEND {TAB 2}
			SEND %futa%
			SEND {TAB 2}
		}
		if (EntryType = "TRI MET")
		{
			SEND {TAB}
			SEND %tri%
			SEND {TAB 3}
		}
		if (EntryType = "TRIMET")
		{
			SEND {TAB}
			SEND %tri%
			SEND {TAB 3}
		}
		if (EntryType = "TRI MET ACCRUE")
		{
			SEND {TAB 2}
			SEND %tri%
			SEND {TAB 2}
		}
		if (EntryType = "TRIMET ACCRUE")
		{
			SEND {TAB 2}
			SEND %tri%
			SEND {TAB 2}
		}
		if (EntryType = "SUTA")
		{
			SEND {TAB}
			SEND %suta%
			SEND {TAB 3}
		}
		if (EntryType = "SUTA ")
		{
			SEND {TAB}
			SEND %suta%
			SEND {TAB 3}
		}
		if (EntryType = "SUTA ACCRUE")
		{
			SEND {TAB 2}
			SEND %suta%
			SEND {TAB 2}
		}

		}
		else
		{
			SEND {SHIFT}+{TAB}
			DifStore := 1
		}


	}
	WinActivate, Register
	SEND ^{PgDn}
	sleep 80
	WinActivate, Journal Entry
return