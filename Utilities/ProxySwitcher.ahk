Gui, Add, GroupBox, x52 y40 w380 h140 , Profiles

Gui, Add, Radio, x82 y70 w100 h30 vGuiSelectedProxy gGuiLabelRadioSelected Group , HostelProxy
Gui, Add, Radio, x82 y100 w100 h30 gGuiLabelRadioSelected, 10.10.10.6
Gui, Add, Radio, x82 y130 w100 h30 gGuiLabelRadioSelected, No Proxy

Gui, Add, Button, x312 y65 w100 h30 gGuiButtonSubmit, Ok
Gui, Add, Button, x312 y120 w100 h30 gGuiButtonExit, Exit

; Generated using SmartGUI Creator 4.0
Gui, Show, x492 y279 h222 w483, Clueless's Proxy Switcher
Return

GuiClose:
ExitApp

GuiButtonSubmit:
Gui, Submit, Nohide
if (GuiSelectedProxy == 1){	;Hostel Proxy
	;Enable Proxy
	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Internet Settings , ProxyEnable, 0x00000001
	
	;Set Hostel Proxy
	RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Internet Settings , ProxyServer, hostelproxy.iiit.ac.in:8080
}
else if (GuiSelectedProxy == 2){ ;10.10.10.6 Proxy
	;Enable Proxy
	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Internet Settings , ProxyEnable, 0x00000001
	
	;Set 10.10.10.6
	RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Internet Settings , ProxyServer, 10.10.10.6:8080
}
else if (GuiSelectedProxy == 3){ ;No Proxy
	;Disable Proxy
	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Internet Settings , ProxyEnable, 0x00000000
}
ExitApp
return

GuiButtonExit:
ExitApp
return

GuiLabelRadioSelected:
return