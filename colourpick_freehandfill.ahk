#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases
SendMode Input ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory
#IfWinActive, ahk_exe OpenToonz.exe
#MaxThreads 2
^!F12::Suspend ; Ctrl+Alt+F12
^!F11::Reload ; Ctrl+Alt+F11

F9 & LButton::
Send +k ; Shift+K: switch to areas colour picker
Click ; To select style under cursor position
Send +f ; Shift+F: switch to freehand fill tool
Click Down
Click Down ; A second click down seems to be needed
KeyWait LButton, U ; Wait for LButton Up since we're not making a freehand selection
Click Up
return
