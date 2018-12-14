#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey, 2
$F10::
	IfWinActive, Grand Theft Auto V
	{
		holdW := !holdW
		if(holdW == 1) {
			Send {w down}
			ToolTip, GTA script is holding down W., 0, 0, 1
			Loop {
				IfWinNotActive, Grand Theft Auto V
				{
					stopScript("GTA Script Turned OFF due to interrupting the macro in game.`nPress F10 to turn back on.")
					holdW = 0
					break
				} else if GetKeyState("w","P") {
					stopScript("GTA Script Turned OFF due to interrupting the macro in game by pressing ""W"".`nPress F10 to turn back on.")
					holdW = 0
					break
				}
			}
		} else {
			stopScript("GTA Script Turned OFF`nPress F10 to turn back on.")
			holdW = 0
		}
	}
Return

stopScript(msg) {
	ToolTip, , , 1
	ToolTip, %msg%, 0, 25, 2
	SetTimer, RemoveToolTip, -2000
	Send {w up}
}

RemoveToolTip:
	ToolTip, , , , 2
Return