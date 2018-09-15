#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

;By Learning one
GetClickType(double=250,hold=500)
{
	;Return values: "1" single click, "2" double click, "3" holding key down
	Hotkey := RegExReplace(A_ThisHotkey,"^(\w* & |\W)"), hold /= 1000, double /= 1000
	KeyWait, %Hotkey%, t%hold%

	if ErrorLevel
		return 3

	KeyWait, %Hotkey%, d t%double%

	return (ErrorLevel) ? 1 : 2
}

F1::
	press := GetClickType()

	if(press = 1){
		;Propagate hotkey. Nothing to do
		Suspend, On
	  Send {F1}
	  Suspend, Off
	}

	if (Press = 2){
		;Send Current Date
		FormatTime, OutputVar,,dd/MMM/yy hh:mm:ssr
		Send,%OutputVar%
	}
	Return

^p::
	InputBox,command,Enter a Command, Enter Command,,,,,,,3
	if ErrorLevel
    Return
	else{
		if IsLabel(command)
		  Gosub %command%	    
	}
Return

jira:
Run,C:\Users\j1013225\AppData\Local\Google\Chrome\Application\chrome.exe --profile-directory="Profile 3" "http://jira.jda.com"
Return

#r::Reload