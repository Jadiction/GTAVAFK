#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey, 2
$F10::
holdW := !holdW
if(holdW == 1) {
	Send {w down}
	ToolTip, GTA script is holding down W., 0, 0, 1
	Loop {
		GetKeyState, wPressed, w
		if(wPressed == "U") {
			WinGetTitle, AW, A
			StringLower, AW, AW
			if(AW == "grand theft auto v") {
				stopScript("Turned OFF due to pressing ""W"" in game.`n`nPress F10 to turn back on.")
				holdW = 0
				break
			}
		}
	}
} else {
	stopScript("Turned OFF`n`nPress F10 to turn back on.")
	holdW = 0
}
Return

stopScript(msg) {
	ToolTip
	TrayTip, GTA AFK Script, %msg%, 2, 17
	Send {w up}
}