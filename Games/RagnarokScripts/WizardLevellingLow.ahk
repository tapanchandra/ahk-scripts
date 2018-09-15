#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Event  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetKeyDelay,300

;Nova Ragnarok ahk_class Nova Ragnarok ahk_exe NovaRO.exe
#Include functions.ahk

;Start Ragnarok
;StartRagnarok()


;Activate RO Screen and get window size
IfWinExist, Nova Ragnarok ahk_class Nova Ragnarok
{
    WinActivate 
    WinGetPos XPos, YPos, WinWidth, WinHeight
    Sleep,2000
}

;Load Information
Array = LoadDataToArray()

;Login
;LoginRagnarok()


;Close popup if present
;imagepath= %A_ScriptDir%\images\ingameclose.png
;ClickOnImage(imagepath,WinWidth,WinHeight)

;Re-orient Screen
SendEvent, {RButton 5}

Loop, 500
{
	;Enable Chat if Required
	imagepath= %A_ScriptDir%\images\chatenabled.png
	PressEnterOnImage(imagepath,WinWidth,WinHeight,1)

	;Go to moscovia
	SendEvent, @go 25{Enter}
	Sleep,3000


	;Heal
	MouseMove,350 , 281, 10
	Sleep,500
	SendEvent {Click 3}
	Sleep,500

	;Open Kafra and Items to Save Precious Items
	ClickOnCoordinate(445,263)
	Sleep, 2000
	Send, {Enter}
	Sleep, 1000
	Send, {Down}
	Sleep, 1000
	Send, {Enter}
	imagepath= %A_ScriptDir%\images\ingameclose.png
	ClickOnImage(imagepath,WinWidth,WinHeight)

	;Open Items
	imagepath= %A_ScriptDir%\images\inventory.png
	Loop,5
	{
		elevel := SearchForImage(imagepath,WinWidth,WinHeight, FoundX, FoundY) 
		if(elevel) {			
			Send, !e
			Sleep,1000
		}
		else {
			break
		}
	}

	;Open Misc Items
	imagepath= %A_ScriptDir%\images\miscitems.png
	ClickOnImage(imagepath,WinWidth,WinHeight)
	Sleep,500


	;Store Important Items
	StoreAllImpItems(Array,WinWidth,WinHeight)

	;Close Kafra 
	imagepath= %A_ScriptDir%\images\ingameclose.png
	ClickOnImage(imagepath,WinWidth,WinHeight)
	Sleep,1000

	;Close Inventory
	imagepath= %A_ScriptDir%\images\inventory.png
	Loop,5
	{
		elevel := SearchForImage(imagepath,WinWidth,WinHeight, FoundX, FoundY) 
		if(!elevel) {			
			Send, !e
			Sleep,1000
		}
		else {
			break
		}
	}
	Sleep,1000

	;Open Tool Dealer
	OpenToolDealer()


	;Sell
	imagepath= %A_ScriptDir%\images\sellbutton.png
	ClickOnImage(imagepath,WinWidth,WinHeight)	


	;Drag to sell box
	Loop, 15
	{
		MouseMove,58 , 238, 0
		SendEvent {LButton Down}
		Sleep 300
		MouseMove,340 , 342, 0
		SendEvent {LButton Up}
		Sleep 200	
	}


	;Sell
	imagepath= %A_ScriptDir%\images\sellbutton.png
	ClickOnImage(imagepath,WinWidth,WinHeight)


	;Open Tool Dealer
	OpenToolDealer()


	;Buy
	imagepath= %A_ScriptDir%\images\buybutton.png
	ClickOnImage(imagepath,WinWidth,WinHeight)
	

	;Flywings
	BuyFlywings(20)

	;Red potions
	;BuyRedPotions(61)

	;BlueGems
	;BuyBluegems(45,WinWidth,WinHeight)

	;Finish Buy
	imagepath= %A_ScriptDir%\images\buybutton2.png
	ClickOnImage(imagepath,WinWidth,WinHeight)

	;Energy Coat
	;Send, {F4}
	;Sleep,6000


	;Goto Map
	MouseMove,530,285, 10
	Sleep,500
	SendEvent {Click 3}
	Sleep,2000
	SendEvent {Enter}
	Sleep,3000
	;ClickOnCoordinate(400,283)	
	;Sleep,1000

	;Move mouse to self
	MouseMove,400,325, 10
	Sleep,2000

	Loop, 25
	{
		;Teleport
		Send, {F9}
		Sleep, 1500

		;Storm Gust
		Send, {F2}
		Sleep,500
		SendEvent {Click 3}		
		Sleep, 7000

		;Storm Gust
		Send, {F2}
		Sleep,500
		SendEvent {Click 3}
		Sleep, 5500

		;Check if dead
		alive := CheckIfDead(WinWidth,WinHeight)
		if(!alive) {
			Tooltip, I am Dead
			Sleep,2000
			Tooltip
			break
		}
	}
}



