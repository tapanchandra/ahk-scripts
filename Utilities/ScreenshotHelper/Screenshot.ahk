#include LetUserSelectRect.ahk
#include Utils.ahk
#include FileOpenDialog.ahk

ShowFileSaveDialog(ByRef filepath)
{
	EnvGet, userdir, USERPROFILE

	HWND          := WinExist(A)

  Filter        := "Image Files (*.bmp)"
  Filter        .= "|Image Files (*.gif)"
  Filter        .= "|Image Files (*.png)"
  Filter        .= "|Image Files (*.jpg)"
  Filter        .= "|Image Files (*.tiff)"
 	Filter        .= "|All Files (*.*)"
 	defaultFilter := 3	
	DialogTitle   := "Save"
	defaultExt    := "png" ;This is useless	

  filepath := DLG_FileSave( HWND
                            , Filter
                            , defaultFilter
                            , userdir
                            , DialogTitle
                            , defaultExt)

  If !(filepath)
		filepath = %userdir%\Downloads\ahk_capture.png

  return
}

PrintScreen::
  ;Choose which form of PScr to execute : 
  	;savescreenshot
  	;savescreenshotfull
  	;savescreenshotwin
  press := GetClickType()

  ;Get Path to nircmd.exe
  EnvGet, rbclassroot, RBCLASSES

  if(press = 1){
		;savescreenshot -- Save Entire Desktop
		ShowFileSaveDialog(filepath)
		cmd := "savescreenshot"		
	}

	if (Press = 2){
		;savescreenshotwin -- Save Active Window
		ShowFileSaveDialog(filepath)
		cmd := "savescreenshotwin"		
	}

	if (Press = 3){
		;savescreenshot -- Save Selected Area
		Tooltip,Select a area
		Sleep 1000
		Tooltip

		LetUserSelectRect(x1, y1, x2, y2)

		width := Abs(x2 - x1)
		height := Abs(y2 - y1)

		ShowFileSaveDialog(filepath)
		cmd := "savescreenshot"
		dimensions = %x1% %y1% %width% %height%		
	}

	Sleep,200

	;Call nircmd
	Run, %rbclassroot%\Executables\nircmd.exe %cmd% "%filepath%" %dimensions%,%rbclassroot%\Executables,Hide

	
	;Propagate PrScr Event to perform the OS default action
  Suspend, On
  Send {PrintScreen}
  Suspend, Off

Return

#r::Reload