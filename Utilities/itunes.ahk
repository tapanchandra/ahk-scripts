#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

IfWinExist, % "Downloads ahk_class iTunes"
{	
	WinActivate
	WinGetPos posX,posY,width,height

	searchStartX := Ceil((4*width)/5)
	searchStartY := 40
	searchEndX := width - 20
	searchEndY :=  Floor((2*height)/5)

	ImageSearch, OutputVarX, OutputVarY, %searchStartX%, %searchStartY%, %searchEndX%, %searchEndY%, D:\SystemHub\Classroot\Files\images\itunes_reload.png

	OutputVarX := OutputVarX + 5
	OutputVarY := OutputVarY + 5
	MouseMove, %OutputVarX%, %OutputVarY%,90
	Click

	Sleep,100

	ImageSearch, OutputVarX, OutputVarY, %searchStartX%, %searchStartY%, %searchEndX%, %searchEndY%, D:\SystemHub\Classroot\Files\images\itunes_reload_dark.png

	OutputVarX := OutputVarX + 5
	OutputVarY := OutputVarY + 5
	MouseMove, %OutputVarX%, %OutputVarY%,90
	Click
}
    
