OpenToolDealer()
{
	;Open Tool Dealer
	MouseMove,245,337, 10
	Sleep,500
	SendEvent {Click 2}
	Sleep,1000	
}

ClickOnImage(imagepath,WinWidth,WinHeight)
{
	Loop,5
	{
		elevel := SearchForImage(imagepath,WinWidth,WinHeight, FoundX, FoundY) 
		if(!elevel) {
			MouseMove,%FoundX% , %FoundY%, 10
			Sleep,500
			SendEvent, {Click 3}
		}
		else {
			break
		}
	}	
}

ClickOnCoordinate(xCoord,yCoord)
{
	MouseMove,%xCoord% , %yCoord%, 10
	Sleep,500
	SendEvent, {Click 3}
}


;0 - Image should exist, 1 - not exist
PressEnterOnImage(imagepath,WinWidth,WinHeight,shouldImageExist)
{
	Loop,5
	{
		elevel := SearchForImage(imagepath,WinWidth,WinHeight, FoundX, FoundY) 
		if(elevel=shouldImageExist) {			
			Send, {Enter}
		}
		else {
			break
		}
	}	
}



SearchForImage(imagepath,endX,endY, ByRef FoundX, ByRef FoundY)
{

	ImageSearch, FoundX, FoundY, 0, 0, endX, endY, %imagepath%
	return errorlevel
}

StartRagnarok()
{
	;Close any existing NovaRO instances
	Process,Exist,NovaRO.exe
	pid := errorlevel
	if(pid) {	
		Process, Close, NovaRO.exe
	}

	;Start Patcher
	Run, "D:\Programs\NovaRO\Nova Patcher.exe",D:\Programs\NovaRO
	Sleep 10000


	;Get Windows size
	IfWinExist, NovaRO Patcher
	{
	    WinActivate 
	    WinGetPos XPos, YPos, WinWidth, WinHeight
	}

	;Press StartButton
	imagepath= %A_ScriptDir%\images\startbutton.png
	elevel := SearchForImage(imagepath,WinWidth,WinHeight, FoundX, FoundY) 
	if(elevel)
	{
		Return		
	}
	MouseMove,%FoundX% , %FoundY%, 10
	Click
	Sleep, 5000	
}




LoginRagnarok()
{
	;Login
	Send, ntca86{Tab}$Meridian9{Enter}
	Sleep 2000
	Send {Enter}
	Sleep 2000
	Send {Enter}
	Sleep, 10000
}

BuyRedPotions(num)
{
	MouseMove,57,429,10
	SendEvent {LButton Down}
	Sleep 500
	MouseMove,340 , 342, 10
	SendEvent {LButton Up}
	Sleep 500
	SendEvent,%num%{Enter}
	Sleep, 2000
}

BuyFlywings(num)
{
	MouseMove,57,270,10
	SendEvent {LButton Down}
	Sleep 500
	MouseMove,340 , 342, 10
	SendEvent {LButton Up}
	Sleep 500
	SendEvent,%num%{Enter}	
}

BuyBluegems(num,WinWidth,WinHeight)
{
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
	Sleep 500
	SendEvent {LButton Up}
	Sleep 500
	SendEvent,%num% {Enter}	
}

StoreItem(img,WinWidth,WinHeight)
{
	searchWidth := WinWidth/2

	elevel := SearchForImage(img,searchWidth,WinHeight, FoundX, FoundY) 	

	if(!elevel) {			
		MouseMove,%FoundX% , %FoundY%, 10
		Sleep, 500
		SendEvent {LButton Down}
		Sleep 500
		MouseMove,442 , 190, 10
		SendEvent {LButton Up}
		Sleep,500
		SendEvent, {Enter}
	}	
}

ScrollDown(num)
{
	MouseMove,289, 389, 10
	Sleep, 500
	SendEvent {Click 3}	
}



LoadDataToArray()
{
	; Create the array, initially empty:
	Array := Object()

	; Write to the array:
	Loop, Read, %A_ScriptDir%\miscitems.txt ; This loop retrieves each line from the file, one at a time.
	{
	    Array.Insert(A_LoopReadLine) ; Append this line to the array.
	}
	Return Array
}

StoreAllImpItems(Array,WinWidth,WinHeight)
{
	for index, element in Array ; Recommended approach in most cases.
	{    
	    StoreItem(element,WinWidth, WinHeight)    
	}

	ScrollDown(num)

	for index, element in Array ; Recommended approach in most cases.
	{    
	    StoreItem(element,WinWidth, WinHeight)    
	}
}

CheckIfDead(WinWidth,WinHeight)
{
	imagepath= %A_ScriptDir%\images\death.png
	elevel := SearchForImage(imagepath,WinWidth,WinHeight, FoundX, FoundY)
	Return elevel
}