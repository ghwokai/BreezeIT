;@version:2015-11-29

;================================
;

;变量调整
volStep := 5

;热键设定

Hotkey,#up,volUp 		;音量提升
Hotkey,^!up,volUp
Hotkey,#down,volDown 	;音量降低
Hotkey,^!down,volDown
hotkey,#h,helpToolTip		;脚本内容帮助显示
hotkey,#F1,runHelpSpy	;启动AHK帮助和SPY
hotkey,#g,gow 		;启动GOW相关
hotkey,#2,resize2		;重置一些窗口大小
hotkey,#3,resize3		;重置一些窗口大小
hotkey,#left,toLeft		;靠左
hotkey,#right,toRight		;靠右
hotkey,#p,atTransparent	;鼠标所指窗口透明化220
hotkey,#i,atTransparent2	;鼠标所指窗口透明化180
hotkey,#o,closeTransparent	; 关闭鼠标所指窗口的透明效果
hotkey,#t,setTop 		;鼠标所指窗口置顶
hotkey,#y,unSetTop		;取消鼠标所指窗口置顶
hotkey,#d,youdaoDict		;复制单词，自动在有道词典里查找

return
;-----------------------------
;音量控制
volUp:
soundSet,+%volStep%
gosub,soundShow
return

volDown:
soundSet,-%volStep%
gosub,soundShow
return



;音量显示单元
soundShow:
soundget,master_volume
intVol := ceil(master_volume)
tooltip,当前音量： %intVol%
gosub, tooltiptimer
return
;===============================
;tooltip定时器

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


helpToolTip: ;脚本内容帮助显示
Tooltip,
(
win-F1:启动AHK帮助和SPY`n
win-g: 启动GOW相关 `n
win-2: 重置一些窗口大小2  
win-3: 重置一些窗口大小3 `n 
win-p: 鼠标所指窗口透明化220  
win-i:鼠标所指窗口透明化180 
win-o: 关闭鼠标所指窗口的透明效果 `n
win-t: 鼠标所指窗口置顶  
win-y:取消鼠标所指窗口置顶 `n 
win-d:复制单词，自动在有道词典里查找 `n 
win-left:靠左 指定大小  
win-right:靠右指定大小`n
win-up:音量提升
Ctrl-alt-up：音量提升
win-down:音量降低
Ctrl-alt-down:音量降低
)	
gosub tooltiptimer2
return
;======================================
runHelpSpy: ;启动AHK帮助和SPY
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

gow: ;启动GOW相关。 Gems of war 需要 代理上GOAGENT
DetectHiddenWindows, On ;开启“隐藏”窗口的查找

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
ToolTip,1执行完毕
gosub tooltiptimer
;msgbox test1
return


resize2: ;重置一些窗口大小

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
ToolTip,指定大小2
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
ToolTip,指定大小3
gosub tooltiptimer
;msgbox test3
return

toLeft: 
WinGet, active_id, ID, A
winmove,ahk_id %active_id%, ,68 , 0 , 1300 , 1080
ToolTip,靠左
gosub tooltiptimer

Return

toRight:
WinGet, active_id, ID, A
winmove,ahk_id %active_id%, ,1368 , 0 , 560 , 1080
ToolTip,靠右
gosub tooltiptimer

Return


;----------------------------------------------------------------------

atTransparent: ;鼠标所指窗口透明化
MouseGetPos, MouseX, MouseY, MouseWin
WinSet, Transparent, 220, ahk_id %MouseWin% ; 0-255,255完全不透明
ToolTip,鼠标所指窗口透明化220
gosub tooltiptimer
return
atTransparent2: ;鼠标所指窗口透明化
MouseGetPos, MouseX, MouseY, MouseWin
WinSet, Transparent, 180, ahk_id %MouseWin% ; 0-255,255完全不透明
ToolTip,鼠标所指窗口透明化180
gosub tooltiptimer
return
closeTransparent:  ; 关闭鼠标所指窗口的透明效果
MouseGetPos,,, MouseWin
WinSet, Transparent, Off, ahk_id %MouseWin%
WinSet, TransColor, Off, ahk_id %MouseWin%
ToolTip,关闭鼠标所指窗口的透明
gosub tooltiptimer
return

;---------------------------------------------------
setTop: ;鼠标所指窗口置顶
MouseGetPos, MouseX, MouseY, MouseWin
WinSet ,AlwaysOnTop ,on,ahk_id %MouseWin%
ToolTip,鼠标所指窗口置顶
gosub tooltiptimer
return
unSetTop: ;取消鼠标所指窗口置顶
MouseGetPos, MouseX, MouseY, MouseWin
WinSet ,AlwaysOnTop ,off,ahk_id %MouseWin%
ToolTip,取消鼠标所指窗口置顶
gosub tooltiptimer
return
;-------------------------------------------------
;!0:: send !{tab} ;alt+Tab


;return

;==========================================
;复制单词，自动在有道词典里查找
youdaoDict:

send ^c


ifwinexist,ahk_class YodaoMainWndClass,,, ;有道主窗口
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
		{	;msgbox 没有启动有道词典
	            	run D:\Program Files\Youdao\Dict\YodaoDict.exe
	            	return
		}	
return
;=====================================


