#z::
reload
return
;----------------------------------
;复制单词，自动在有道词典里查找
#q::
q::
send ^c

ifwinexist,ahk_class YdMiniModeWndClassName,,, ;有道mini窗口
	{
		WinActivate,ahk_class YdMiniModeWndClassName,,,
		send ^v
		sleep 500
		send {enter}
		sleep 500
		MouseMove,150,100,0
		Return
	}
	else
	{
	ifwinexist,ahk_class YodaoMainWndClass,,, ;有道主窗口
		{
			WinActivate,ahk_class YodaoMainWndClass,,,
			send ^v
			sleep 500
			send {enter}
			sleep 500
			ControlClick,Chrome_RenderWidgetHostHWND1
			MouseMove,340,180,0
			return
		}
		else
			msgbox 没有启动有道词典
			return
	}
	
;同一个快捷键在不同窗口不同功能
#IfWinActive ahk_class YdMiniModeWndClassName	
	w::
	send ^c
	WinActivate,ahk_class XLMAIN
	MouseMove,390,440,0
	return
#IfWinActive	ahk_class XLMAIN
	w::send [^v]{tab}
	





