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
					Sleep, 1000
					holdW = 0
					stopScript("GTA Script Turned OFF due to interrupting the macro in game.`nPress F10 to turn back on.")
					break
				}
			}
		} else {
			holdW = 0
			stopScript("GTA Script Turned OFF.`nPress F10 to turn back on.")
		}
	}
return

stopScript(msg) {
	Send {w up}
	ToolTip, , , 1
	ToolTip, %msg%, 0, 25, 2
	SetTimer, RemoveToolTip, -2000
}

RemoveToolTip:
	ToolTip, , , , 2
Return