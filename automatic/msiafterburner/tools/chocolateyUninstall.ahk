; default environment
DetectHiddenWindows, off
SetControlDelay, 20

; modified environment
#NoEnv
#NoTrayIcon
DetectHiddenText, off
SetTitleMatchMode, 2  ;contains

; answer MSI Afterburner "keep settings" prompt
winTitle1 = MSI Afterburner Uninstall ahk_class #32770
winText1  = Do you want
WinWait, %winTitle1%, %winText1%, 20
ControlClick, Button2 ; &No (do not keep settings)

; answer RTSS "keep settings" prompt
winTitle2 = RivaTuner Statistics Server Uninstall ahk_class #32770
winText2  = Do you want
WinWait, %winTitle2%, %winText2%, 20
ControlClick, Button2 ; &No (do not keep settings)

ExitApp