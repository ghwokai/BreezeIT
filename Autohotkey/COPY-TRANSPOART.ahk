#z::
reload
return
;----------------------------------
;���Ƶ��ʣ��Զ����е��ʵ������
#q::
q::
send ^c

ifwinexist,ahk_class YdMiniModeWndClassName,,, ;�е�mini����
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
	ifwinexist,ahk_class YodaoMainWndClass,,, ;�е�������
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
			msgbox û�������е��ʵ�
			return
	}
	
;ͬһ����ݼ��ڲ�ͬ���ڲ�ͬ����
#IfWinActive ahk_class YdMiniModeWndClassName	
	w::
	send ^c
	WinActivate,ahk_class XLMAIN
	MouseMove,390,440,0
	return
#IfWinActive	ahk_class XLMAIN
	w::send [^v]{tab}
	





