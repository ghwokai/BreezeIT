;@version:2015-11-29

;================================
;

;��������
volStep := 5

;�ȼ��趨

Hotkey,#up,volUp 		;��������
Hotkey,^!up,volUp
Hotkey,#down,volDown 	;��������
Hotkey,^!down,volDown
hotkey,#h,helpToolTip		;�ű����ݰ�����ʾ
hotkey,#F1,runHelpSpy	;����AHK������SPY
hotkey,#g,gow 		;����GOW���
hotkey,#2,resize2		;����һЩ���ڴ�С
hotkey,#3,resize3		;����һЩ���ڴ�С
hotkey,#left,toLeft		;����
hotkey,#right,toRight		;����
hotkey,#p,atTransparent	;�����ָ����͸����220
hotkey,#i,atTransparent2	;�����ָ����͸����180
hotkey,#o,closeTransparent	; �ر������ָ���ڵ�͸��Ч��
hotkey,#t,setTop 		;�����ָ�����ö�
hotkey,#y,unSetTop		;ȡ�������ָ�����ö�
hotkey,#d,youdaoDict		;���Ƶ��ʣ��Զ����е��ʵ������

return
;-----------------------------
;��������
volUp:
soundSet,+%volStep%
gosub,soundShow
return

volDown:
soundSet,-%volStep%
gosub,soundShow
return



;������ʾ��Ԫ
soundShow:
soundget,master_volume
intVol := ceil(master_volume)
tooltip,��ǰ������ %intVol%
gosub, tooltiptimer
return
;===============================
;tooltip��ʱ��

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return

tooltiptimer:
#Persistent
SetTimer, RemoveToolTip, 1000
return

tooltiptimer2:
#Persistent
SetTimer, RemoveToolTip, 6000
return

;==================================


helpToolTip: ;�ű����ݰ�����ʾ
Tooltip,
(
win-F1:����AHK������SPY`n
win-g: ����GOW��� `n
win-2: ����һЩ���ڴ�С2  
win-3: ����һЩ���ڴ�С3 `n 
win-p: �����ָ����͸����220  
win-i:�����ָ����͸����180 
win-o: �ر������ָ���ڵ�͸��Ч�� `n
win-t: �����ָ�����ö�  
win-y:ȡ�������ָ�����ö� `n 
win-d:���Ƶ��ʣ��Զ����е��ʵ������ `n 
win-left:���� ָ����С  
win-right:����ָ����С`n
win-up:��������
Ctrl-alt-up����������
win-down:��������
Ctrl-alt-down:��������
)	
gosub tooltiptimer2
return
;======================================
runHelpSpy: ;����AHK������SPY
;DetectHiddenWindows, On
IfNotExist, ahk_exe hh.exe
	{
		run D:\ebook\chm\AutoHotkey Help.chm
	}
IfNotExist, Active Window Info
	{
		run D:\Program Files\AutoHotkey\AU3_Spy.exe
	}
;DetectHiddenWindows, off
Return
;----------------------------------------------------------------------

gow: ;����GOW��ء� Gems of war ��Ҫ ������GOAGENT
DetectHiddenWindows, On ;���������ء����ڵĲ���

IfWinNotExist, GoAgent v3.2.3
	{
		run D:\GreenSoft\g3\goagent-3.0\local\goagent.exe
	}
IfWinNotExist, ahk_exe Proxifier.exe
	{
		run D:\Program Files\Proxifier\Proxifier.exe
	}
IfWinNotExist,ahk_exe GemsOfWar.exe ;Run Gems of war
	{
		run steam://rungameid/329110
		sleep 5000
		WinMove, , , 64, 156, 1130,664
	}
IfWinExist,Gems of War ;If Gems of war Exist,reset winsize and postion
	{
		WinMove, , , 64, 156, 1130,664

	}
DetectHiddenWindows, off
ToolTip,1ִ�����
gosub tooltiptimer
;msgbox test1
return


resize2: ;����һЩ���ڴ�С

IfWinExist, Gems of War ;If Gems of war Exist,reset winsize and postion
	{
		WinMove, , , 64, 156, 1130,664
	}
IfWinExist, ahk_class PotPlayer
	{
		WinMove, , , 1194, 246, 726, 434
	}
IfWinExist, ahk_exe sublime_text.exe
	{
		WinMove, , , 68, 0, 1125, 1080
	}
ToolTip,ָ����С2
gosub tooltiptimer
;MsgBox test2
return


resize3:

IfWinExist, ahk_class PotPlayer
	{
		WinMove, , , 1372, 246, 548, 434
	}
;IfWinExist, ahk_exe firefox.exe
	;{
		;WinMove, , , 68, 0, 1300, 1080
	;}
IfWinExist, ahk_exe sublime_text.exe
	{
		WinMove, , , 68, 0, 1300, 1080
	}
ToolTip,ָ����С3
gosub tooltiptimer
;msgbox test3
return

toLeft: 
WinGet, active_id, ID, A
winmove,ahk_id %active_id%, ,68 , 0 , 1300 , 1080
ToolTip,����
gosub tooltiptimer

Return

toRight:
WinGet, active_id, ID, A
winmove,ahk_id %active_id%, ,1368 , 0 , 560 , 1080
ToolTip,����
gosub tooltiptimer

Return


;----------------------------------------------------------------------

atTransparent: ;�����ָ����͸����
MouseGetPos, MouseX, MouseY, MouseWin
WinSet, Transparent, 220, ahk_id %MouseWin% ; 0-255,255��ȫ��͸��
ToolTip,�����ָ����͸����220
gosub tooltiptimer
return
atTransparent2: ;�����ָ����͸����
MouseGetPos, MouseX, MouseY, MouseWin
WinSet, Transparent, 180, ahk_id %MouseWin% ; 0-255,255��ȫ��͸��
ToolTip,�����ָ����͸����180
gosub tooltiptimer
return
closeTransparent:  ; �ر������ָ���ڵ�͸��Ч��
MouseGetPos,,, MouseWin
WinSet, Transparent, Off, ahk_id %MouseWin%
WinSet, TransColor, Off, ahk_id %MouseWin%
ToolTip,�ر������ָ���ڵ�͸��
gosub tooltiptimer
return

;---------------------------------------------------
setTop: ;�����ָ�����ö�
MouseGetPos, MouseX, MouseY, MouseWin
WinSet ,AlwaysOnTop ,on,ahk_id %MouseWin%
ToolTip,�����ָ�����ö�
gosub tooltiptimer
return
unSetTop: ;ȡ�������ָ�����ö�
MouseGetPos, MouseX, MouseY, MouseWin
WinSet ,AlwaysOnTop ,off,ahk_id %MouseWin%
ToolTip,ȡ�������ָ�����ö�
gosub tooltiptimer
return
;-------------------------------------------------
;!0:: send !{tab} ;alt+Tab


;return

;==========================================
;���Ƶ��ʣ��Զ����е��ʵ������
youdaoDict:

send ^c


ifwinexist,ahk_class YodaoMainWndClass,,, ;�е�������
	{
		WinActivate,ahk_class YodaoMainWndClass,,,
		send ^v
		sleep 500
		send {enter}
		sleep 500
		;ControlClick,Chrome_RenderWidgetHostHWND1
		;MouseMove,340,180,0
		return
	}
	else
		{	;msgbox û�������е��ʵ�
	            	run D:\Program Files\Youdao\Dict\YodaoDict.exe
	            	return
		}	
return
;=====================================


