
/*
;��ǰ��������WIN+1
#8::
WinGet, active_id, ID, A
WinMaximize, ahk_id %active_id%
ToolTip,���
gosub tooltiptimer
Return

;��С��WIN+2
#9::
WinGet, active_id, ID, A
WinMinimize, ahk_id %active_id%
ToolTip,��С��
gosub tooltiptimer
return
#0::
WinGet, active_id, ID, A
WinRestore, ahk_id %active_id%
ToolTip,��ԭ
gosub tooltiptimer
Return
*/
;----------------------------------------------------------
XButton2:: ;������С�����е�������

ifwinexist,ahk_class YodaoMainWndClass,,, ;�е�������
WinActivate,ahk_class YodaoMainWndClass,,,

return


;---------------------------------------------------
#T:: ;�����ָ�����ö�
MouseGetPos, MouseX, MouseY, MouseWin
WinSet ,AlwaysOnTop ,on,ahk_id %MouseWin%
ToolTip,�����ָ�����ö�
gosub tooltiptimer
return
#Y:: ;ȡ�������ָ�����ö�
MouseGetPos, MouseX, MouseY, MouseWin
WinSet ,AlwaysOnTop ,off,ahk_id %MouseWin%
ToolTip,ȡ�������ָ�����ö�
gosub tooltiptimer
return
;-------------------------------------------------
!0:: send !{tab} ;alt+Tab


return


;------------------------------------------------

#p:: ;�����ָ����͸����
MouseGetPos, MouseX, MouseY, MouseWin
WinSet, Transparent, 180, ahk_id %MouseWin%
ToolTip,�����ָ����͸����
gosub tooltiptimer
return
#o::  ; �ر������ָ���ڵ�͸��Ч��
MouseGetPos,,, MouseWin
WinSet, Transparent, Off, ahk_id %MouseWin%
WinSet, TransColor, Off, ahk_id %MouseWin%
ToolTip,�ر������ָ���ڵ�͸��
gosub tooltiptimer
return



;----------------------------------------------------------
#1::
WinGet, active_id, ID, A
winmove,ahk_id %active_id%,,550,50,727,711,,
ToolTip,ָ����С1
gosub tooltiptimer
Return

#2::
WinGet, active_id, ID, A
winmove,ahk_id %active_id%,,710,50,564,711,,
ToolTip,ָ����С2
gosub tooltiptimer
Return

#3::
WinGet, active_id, ID, A
winmove,ahk_id %active_id%,,0,50,710,711,,
ToolTip,ָ����С3
gosub tooltiptimer

Return









;tooltip��ʱ��
tooltiptimer:
#Persistent
SetTimer, RemoveToolTip, 1000
return
RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return

