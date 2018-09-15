#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.




^+l::
IfWinExist, % "Transportation Manager - Google Chrome ahk_class Chrome_WidgetWin_1"
{	
	WinActivate
	WinGetPos posX,posY,width,height

	searchStartX := 15
	searchStartY := 135
	searchEndX := width - 10
	searchEndY :=  height - 10

	ImageSearch, OutputVarX, OutputVarY, %searchStartX%, %searchStartY%, %searchEndX%, %searchEndY%, D:\SystemHub\Classroot\Files\images\shipment_processing.png

	if (ErrorLevel != 1) {
		OutputVarX := OutputVarX + 5
		OutputVarY := OutputVarY + 5		
		MouseMove, %OutputVarX%, %OutputVarY%,90
		Click		
	}

	Sleep, 2000

	ImageSearch, OutputVarX, OutputVarY, %searchStartX%, %searchStartY%, %searchEndX%, %searchEndY%, D:\SystemHub\Classroot\Files\images\shipments_tab.png

	if (ErrorLevel != 1) {
		OutputVarX := OutputVarX + 45
		OutputVarY := OutputVarY + 5		
		MouseMove, %OutputVarX%, %OutputVarY%,90
		Click		
	}

	Sleep, 2000


	ImageSearch, OutputVarX, OutputVarY, %searchStartX%, %searchStartY%, %searchEndX%, %searchEndY%, D:\SystemHub\Classroot\Files\images\shipment_tab_shipment_id.png

	if (ErrorLevel != 1) {
		OutputVarX := OutputVarX + 200
		OutputVarY := OutputVarY + 5		
		MouseMove, %OutputVarX%, %OutputVarY%,90
		Click
		Sleep, 500
		Send, %clipboard%
	}

	Sleep, 2000
}

^+m::
Reload
