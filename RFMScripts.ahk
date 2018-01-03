#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetKeyDelay, 0
SetDefaultMouseSpeed, 0
SetMouseDelay, 0
SetTitleMatchMode, 2

^!z::
	Click 140, 445
	Click 140, 462
	Click 140, 477
	Click 140, 489
	Click 140, 503
	Click 140, 516
	Click 140, 531
	Click 140, 544
	Click 140, 558
	MouseMove 810, 660
return

^!x::
	StringReplace, clipboard, clipboard, `r`n, +, UseErrorLevel
	StringTrimRight, clipboard, clipboard, 1
	SEND ^v
return

^!s::
	KeyWait Control
	KeyWait Alt
	Loop, parse, clipboard, `r, %A_Space%%A_Tab%$`n
	{
		SEND %A_LoopField%
		SEND {TAB 2}
	}
return

^!a::
	KeyWait Control
	KeyWait Alt
	SEND {TAB 2}
return


^!d::
	KeyWait Control
	KeyWait Alt
	Click 210, 291
	PixelGetColor, color, 238, 344
	While (color="0xF0F0F0")
	{
		SLEEP 50
		PixelGetColor, color, 238, 344
	}

	PixelGetColor, color, 238, 344
	While !(color="0xF0F0F0")
	{
		SLEEP 50
		PixelGetColor, color, 238, 344
	}

	Click 1850, 263
	SLEEP, 120
	Click 1211, 666
	SLEEP, 120
	SEND {UP 5}
	SEND {ENTER}
	SLEEP, 120
	CLICK 1830, 960
	MOUSEMOVE 1111, 536
	SLEEP, 1000

	PixelGetColor, color, 60, 130
	While !(color="0xFFFFFF")
	{
		SLEEP 50
		PixelGetColor, color, 60, 130
	}

	CLICK
	MOUSEMOVE 1200, 585
return


^!q::
	KeyWait Control
	KeyWait Alt
	Click 210, 291
	PixelGetColor, color, 238, 344
	While (color="0xF0F0F0")
	{
		SLEEP 50
		PixelGetColor, color, 238, 344
	}

	PixelGetColor, color, 238, 344
	While !(color="0xF0F0F0")
	{
		SLEEP 50
		PixelGetColor, color, 238, 344
	}

	Click 1850, 263
	SLEEP, 120
	Click 264, 356
	SLEEP, 120
		CLICK 1830, 960
	MOUSEMOVE 1111, 536
	SLEEP, 1000

	PixelGetColor, color, 60, 130
	While !(color="0xFFFFFF")
	{
		SLEEP 50
		PixelGetColor, color, 60, 130
	}

	CLICK
	MOUSEMOVE 1200, 585
return


^!g::
	KeyWait Control
	KeyWait Alt
	Click 210, 291
	SLEEP, 4500
	Click 1850, 263
	SLEEP, 120
	Click 1211, 666
	SLEEP, 120
	SEND {UP 5}
	SEND {ENTER}
	SLEEP, 120
	CLICK 1830, 960
	MOUSEMOVE 1111, 536
	SLEEP, 3600
	CLICK
	MOUSEMOVE 1200, 585
return