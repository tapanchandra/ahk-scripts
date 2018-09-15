#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance
SetKeyDelay,10
SendMode Event 
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

IfWinExist, PuTTY Configuration
{
    WinActivate ; use the window found above
}
else
{
	Run,C:\\Putty.exe
	WinActivate
}
Sleep,1000

Send,10.10.10.7{Enter}
Sleep,1000

Send,chandra{Enter}
Sleep,500
Send,chryscrim86{Enter}

return
