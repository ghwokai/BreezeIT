
/*
;当前激活窗口最大化WIN+1
#8::
WinGet, active_id, ID, A
WinMaximize, ahk_id %active_id%
ToolTip,最大化
gosub tooltiptimer
Return

;最小化WIN+2
#9::
WinGet, active_id, ID, A
WinMinimize, ahk_id %active_id%
ToolTip,最小化
gosub tooltiptimer
return
#0::
WinGet, active_id, ID, A
WinRestore, ahk_id %active_id%
ToolTip,还原
gosub tooltiptimer
Return
*/
;----------------------------------------------------------
XButton2:: ;激活最小化的有道主窗口

ifwinexist,ahk_class YodaoMainWndClass,,, ;有道主窗口
WinActivate,ahk_class YodaoMainWndClass,,,

return


;---------------------------------------------------
#T:: ;鼠标所指窗口置顶
MouseGetPos, MouseX, MouseY, MouseWin
WinSet ,AlwaysOnTop ,on,ahk_id %MouseWin%
ToolTip,鼠标所指窗口置顶
gosub tooltiptimer
return
#Y:: ;取消鼠标所指窗口置顶
MouseGetPos, MouseX, MouseY, MouseWin
WinSet ,AlwaysOnTop ,off,ahk_id %MouseWin%
ToolTip,取消鼠标所指窗口置顶
gosub tooltiptimer
return
;-------------------------------------------------
!0:: send !{tab} ;alt+Tab


return


;------------------------------------------------

#p:: ;鼠标所指窗口透明化
MouseGetPos, MouseX, MouseY, MouseWin
WinSet, Transparent, 180, ahk_id %MouseWin%
ToolTip,鼠标所指窗口透明化
gosub tooltiptimer
return
#o::  ; 关闭鼠标所指窗口的透明效果
MouseGetPos,,, MouseWin
WinSet, Transparent, Off, ahk_id %MouseWin%
WinSet, TransColor, Off, ahk_id %MouseWin%
ToolTip,关闭鼠标所指窗口的透明
gosub tooltiptimer
return



;----------------------------------------------------------
#1::
WinGet, active_id, ID, A
winmove,ahk_id %active_id%,,550,50,727,711,,
ToolTip,指定大小1
gosub tooltiptimer
Return

#2::
WinGet, active_id, ID, A
winmove,ahk_id %active_id%,,710,50,564,711,,
ToolTip,指定大小2
gosub tooltiptimer
Return

#3::
WinGet, active_id, ID, A
winmove,ahk_id %active_id%,,0,50,710,711,,
ToolTip,指定大小3
gosub tooltiptimer

Return









;tooltip定时器
tooltiptimer:
#Persistent
SetTimer, RemoveToolTip, 1000
return
RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return


