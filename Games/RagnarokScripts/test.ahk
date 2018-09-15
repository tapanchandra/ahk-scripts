#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Event  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetKeyDelay,300

;Nova Ragnarok ahk_class Nova Ragnarok ahk_exe NovaRO.exe
#Include functions.ahk


;Activate RO Screen and get window size
IfWinExist, Nova Ragnarok ahk_class Nova Ragnarok
{
    WinActivate 
    WinGetPos XPos, YPos, WinWidth, WinHeight
    Sleep,2000
}

MouseMove,271,489,10
Sleep, 500
Loop,6
{
	SendEvent, {Click 3}
	Sleep,1000
}

imagepath= %A_ScriptDir%\images\bluegemstone.png
ClickOnImage(imagepath,WinWidth,WinHeight)
Sleep,500
SendEvent {LButton Down}
Sleep 500
MouseMove,340 , 342, 10
Sleep,500
SendEvent {LButton Up}
Sleep 500
SendEvent,20 {Enter}	