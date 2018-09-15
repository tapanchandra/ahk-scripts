#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Start Control Panel
EnvGet, sysroot, SystemRoot
Run, %sysroot%\system32\control.exe,,Max
WinActivate, Control Panel ahk_class CabinetWClass

Sleep,500
Send,Manage Wireless Networks
Sleep,500
Send,{Down 2}{Enter}
Sleep,500

;Delete jWlan
Run,netsh wlan delete profile name=jWLAN interface="Wireless Network Connection",,Min
Sleep,1000

;Add New Profile
Send,{Tab 3}{Enter}
Sleep,1000

;Create Manual Profile
Send,{Enter}
Sleep,500

;Enter Profile Details
Send,jWLAN{Tab}{Down 5}{Enter}
Sleep,5000


;Press Enter on "Change Connection Settings Button"
Send,{Enter}
Sleep, 500

;Go to security tab
Send,+{Tab}{Right}
Sleep, 1000

;Move to PEAP settings button and open
Send,{Tab 4}{Enter}
Sleep, 1000

;Remove Validate certificate flag
Send,{Space}
Sleep, 500

;Click on configure button
;Send,{Tab 2}
;Sleep, 500
;Send, {Space}
;Sleep, 1000

;Remove checkbox and come back
;Send, +{Tab}
;Sleep,500
;Send,{Space}
;Sleep, 500
;Send,{Enter}
;Sleep,1000

;Remove Enable Fast Reconnect flag
Send,{Tab 3}
Sleep, 1000
Send, {Space}
Sleep, 1000
Send, {Enter}
Sleep, 1000

;Enter Advanced Settings
Send,{Tab 2}
Sleep, 1000
Send, {Enter}


;Select Specify authentication flag
Send,{Space} 
Sleep,1000
Send,{Tab}{Down 2}
Sleep,1000
Send,{Tab}{Enter}
Sleep,2000

Send, JDA\j1013225{Tab}
;Sleep,10000
;Send, {Enter}

;Sleep 1000
;Send,{Enter}{Esc 2}
;Sleep 500

;Send,!{F4}