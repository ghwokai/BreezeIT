#Persistent
SetTimer, KillQQPop, 1000
return

KillQQPop:
IfWinExist, ahk_class TXGuiFoundation
{
    ;sleep 1000
    WinGetPos, Xpos, Ypos, Width, Height
    if (Width < 400 AND A_ScreenWidth <(Xpos + 400) AND A_ScreenHeight <(Ypos + 400))
    {
        WinGetTitle, Title
        if (StrLen(Title)!= 0 AND Title!= "QQ" AND !(Title~="@") AND !(Title~="(") AND !(Title="TXMenuWindow"))
        {
            WinClose
            ;TrayTip,喵了腾讯, 关闭了 %Title%
            file := FileOpen("log.txt", "a")
            file.WriteLine(A_YYYY " " A_MM " " A_DD " " A_Hour ":" A_Min ":" A_Sec " —— " Title  "`n`r")
            file.Close()
            ;sleep 1000
            ;TrayTip
        }
    }
}
return
