#SingleInstance Force
#Persistent
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey, 2

$F10::
	holdW := !holdW
	if (WinActive("Grand Theft Auto V")) {
		if(holdW == 1) {
			Send {w down}
			ToolTip, [GTA Script] - Holding down W., 0, 0, 1
			while (holdW == 1)
			{
				if (!WinActive("Grand Theft Auto V") || GetKeyState("w","P"))
				{
					
					reload()
				}
			}
		} else {
			reload()
		}
	}
return

reload() {
	Send {w up}
	Sleep, 100
	Reload
}