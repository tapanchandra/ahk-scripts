#Include Acc.ahk

#Persistent
SetTitleMatchMode 2

OnExit, UnHook

EVENT_OBJECT_CREATE := "0x8000"

pCallback := RegisterCallback("WinEventProc")
Acc_SetWinEventHook(EVENT_OBJECT_CREATE, EVENT_OBJECT_CREATE, pCallBack)
return

UnHook:
	Acc_UnhookWinEvent(pCallback)
	ExitApp


WinEventProc(hHook, event, hWnd, idObject, idChild, eventThread, eventTime) {	
	IfWinExist,  % "This is an unregistered copy ahk_class #32770"
	{		
		WinWaitActive,  % "This is an unregistered copy ahk_class #32770"
		WinClose,       % "This is an unregistered copy ahk_class #32770"
		WinWaitClose,   % "This is an unregistered copy ahk_class #32770"
	}
}

#r::Reload