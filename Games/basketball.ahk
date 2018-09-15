; SciTE4AutoHotkey v3 autorun script
;
; November 7, 2010 - fincs
;

#NoEnv

SetWorkingDir, %A_ScriptDir%
SendMode,Input
SetKeyDelay,-1
SetMouseDelay,0

^a::

firstThrowDelay = 195
secondThrowDelay = 396
thirdThrowDelay = 594
fourthThrowDelay = 740
;fifthThrowDelay = 930

cooloff1 = 930
cooloff2 = 918
cooloff3 = 918
cooloff4 = 911
;cooloff5 = 900

;Press on Start
MouseMove,726,282,5
Sleep,100
Click
MouseMove,10,282,5
Sleep,800
;Stage 1

;1
Send {Space}
Sleep,%firstThrowDelay%
Send {Space}

Sleep,%cooloff1%

;2
Send {Space}
Sleep,%firstThrowDelay%
Send {Space}

Sleep,%cooloff1%

;3
Send {Space}
Sleep,%firstThrowDelay%
Send {Space}

Sleep,%cooloff1%

;4
Send {Space}
Sleep,%firstThrowDelay%
Send {Space}

Sleep,%cooloff1%

;5
Send {Space}
Sleep,%firstThrowDelay%
Send {Space}

Sleep,%cooloff1%

;6
Send {Space}
Sleep,%firstThrowDelay%
Send {Space}

Sleep,%cooloff1%


;Stage 2


;7
Send {Space}
Sleep,%secondThrowDelay%
Send {Space}

Sleep,%cooloff2%

;8
Send {Space}
Sleep,%secondThrowDelay%
Send {Space}

Sleep,%cooloff2%

;9
Send {Space}
Sleep,%secondThrowDelay%
Send {Space}

Sleep,%cooloff2%

;10
Send {Space}
Sleep,%secondThrowDelay%
Send {Space}

Sleep,%cooloff2%

;Stage 3

;11
Send {Space}
Sleep,%thirdThrowDelay%
Send {Space}

Sleep,%cooloff3%

;12
Send {Space}
Sleep,%thirdThrowDelay%
Send {Space}

Sleep,%cooloff3%

;13
Send {Space}
Sleep,%thirdThrowDelay%
Send {Space}

Sleep,%cooloff3%

;14
Send {Space}
Sleep,%thirdThrowDelay%
Send {Space}

Sleep,%cooloff3%



;Stage 4

;15
Send {Space}
Sleep,%fourthThrowDelay%
Send {Space}

Sleep,%cooloff4%

;16
Send {Space}
Sleep,%fourthThrowDelay%
Send {Space}

Sleep,%cooloff4%

;17
Send {Space}
Sleep,%fourthThrowDelay%
Send {Space}

Sleep,%cooloff4%

;Stage 5

;19
;Send {Space}
;Sleep,%fifthThrowDelay%
;Send {Space}

;Sleep,%cooloff5%

;20
;Send {Space}
;Sleep,%fifthThrowDelay%
;Send {Space}

;Sleep,%cooloff5%

return
!p::Pause

!s::Exit

!r::Reload