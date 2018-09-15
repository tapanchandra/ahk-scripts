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