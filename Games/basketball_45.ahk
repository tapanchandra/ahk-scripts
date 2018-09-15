; SciTE4AutoHotkey v3 autorun script
;
; November 7, 2010 - fincs
;

#NoEnv

SetWorkingDir, %A_ScriptDir%
SendMode,Input
SetKeyDelay,0
SetMouseDelay,0

^a::

firstThrowDelay = 200
secondThrowDelay = 400
thirdThrowDelay = 600
fourthThrowDelay = 780
cooloff = 950

;Press on Start
MouseMove,726,282,5
Sleep,100
Click
Sleep,200
;1
Send {Space}
Sleep,%firstThrowDelay%
Send {Space}

Sleep,%cooloff%

;2
Send {Space}
Sleep,%firstThrowDelay%
Send {Space}

Sleep,%cooloff%

;3
Send {Space}
Sleep,%firstThrowDelay%
Send {Space}

Sleep,%cooloff%

;4
Send {Space}
Sleep,%firstThrowDelay%
Send {Space}

Sleep,%cooloff%

;5
Send {Space}
Sleep,%firstThrowDelay%
Send {Space}

Sleep,%cooloff%

;6
Send {Space}
Sleep,%firstThrowDelay%
Send {Space}

Sleep,%cooloff%


;Stage 2


;7
Send {Space}
Sleep,%secondThrowDelay%
Send {Space}

Sleep,%cooloff%

;8
Send {Space}
Sleep,%secondThrowDelay%
Send {Space}

Sleep,%cooloff%

;9
Send {Space}
Sleep,%secondThrowDelay%
Send {Space}

Sleep,%cooloff%

;10
Send {Space}
Sleep,%secondThrowDelay%
Send {Space}

Sleep,%cooloff%

;Stage 3


;11
Send {Space}
Sleep,%thirdThrowDelay%
Send {Space}

Sleep,%cooloff%

;12
Send {Space}
Sleep,%thirdThrowDelay%
Send {Space}

Sleep,%cooloff%

;13
Send {Space}
Sleep,%thirdThrowDelay%
Send {Space}

Sleep,%cooloff%

;14
Send {Space}
Sleep,%thirdThrowDelay%
Send {Space}

Sleep,%cooloff%



;Stage 4

;15
Send {Space}
Sleep,%fourthThrowDelay%
Send {Space}

Sleep,%cooloff%

;16
Send {Space}
Sleep,%fourthThrowDelay%
Send {Space}

Sleep,%cooloff%

;17
Send {Space}
Sleep,%fourthThrowDelay%
Send {Space}

Sleep,%cooloff%

;18
Send {Space}
Sleep,950
Send {Space}

Sleep,%cooloff%

return
!p::Pause

!s::Exit

!r::Reload