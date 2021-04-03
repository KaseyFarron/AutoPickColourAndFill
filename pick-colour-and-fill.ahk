;===============================================================================
; Pick Colour & Fill Script
;
; Description:
; For various painting programs, allows in a single click to auto select the
; colour under the cursor position and begins a freehand (lasso) selection using
; the tool (if available) by the respective program. This is useful when you
; need to fill small unfilled areas quickly left over by a normal bucket fill.
;
; Created by Kasey Farron, 01-03-2021
;===============================================================================

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
Settings := "settings.ini"
#SingleInstance, Force

;===============================================================================
;====== LOAD SETTINGS ==========================================================
;===============================================================================

; If the settings.ini file doesn't exist, create it and set default values.
IfNotExist, %Settings%
{
  IniWrite, F9`n, %Settings%, Core, ReadyKey

  IniWrite, Shift+K, %Settings%, OpenToonz, StylePickerTool_Areas
  IniWrite, Shift+F, %Settings%, OpenToonz, FillTool_Freehand
  IniWrite, Alt+M, %Settings%, OpenToonz, ToolMode_Areas
  IniWrite, Alt+Shift+M, %Settings%, OpenToonz, ToolMode_LinesAreas
  IniWrite, Shift+N, %Settings%, OpenToonz, ToolType_Normal
  IniWrite, 1, %Settings%, OpenToonz, Option_FillTypeToNormalAtEnd
  IniWrite, 1`n, %Settings%, OpenToonz, Option_ToolModeToLinesAndAreasAtEnd

  IniWrite, Alt, %Settings%, CLIPStudioPaint, ColourPicker
  IniWrite, V, %Settings%, CLIPStudioPaint, FillTool_CloseAndFill
  IniWrite, F, %Settings%, CLIPStudioPaint, FillTool_Normal
  IniWrite, 1`n, %Settings%, CLIPStudioPaint, Option_SelectFillToolNormalAtEnd
}

; Load sections as associative arrays, read all keys in section as a single
; string, split before and after the equals sign, makes it easier to make the
; strings lowercase, etc.
IniRead, Core_Hotkeys, %Settings%, Core
Core := Object(StrSplit(Core_Hotkeys, ["=", "`n"])*)
Core := CustomReplace(Core)

IniRead, OT_Hotkeys, %Settings%, OpenToonz
OT := Object(StrSplit(OT_Hotkeys, ["=", "`n"])*)
OT := CustomReplace(OT)

IniRead, CSP_Hotkeys, %Settings%, CLIPStudioPaint
CSP := Object(StrSplit(CSP_Hotkeys, ["=", "`n"])*)
CSP := CustomReplace(CSP)

;===============================================================================
;====== HOTKEYS ================================================================
;===============================================================================

; ReadyKey, user must hold this to ready the command before clicking.
ReadyKey := Core.ReadyKey
Hotkey, %ReadyKey% & LButton, SubRoutine

SubRoutine:
  ;====== OpenToonz ============================================================
  if WinActive("ahk_exe OpenToonz.exe") || WinActive("ahk_exe Tahoma2D.exe")
  {
    Send % OT.StylePickerTool_Areas ; Change to Style Picker tool: Areas Mode
    Click                           ; Select colour under cursor position
    Send % OT.FillTool_Freehand     ; Change to fill tool freehand type
    Send % OT.ToolMode_Areas        ; Change tool mode to areas
    Click Down
    Click Down          ; Two click downs seem to be needed
    KeyWait LButton, Up ; Wait since we're now making a freehand selection
    Click Up            ; Ends the selection and paints it

    ;====== OPTIONS ============================================================
    ; Selects the Tool Type Normal at end of the command.
    if (OT.Option_FillTypeToNormalAtEnd)
      Send % OT.ToolType_Normal
    ; Selects the Tool Mode Lines & Areas at end of the command.
    if (OT.Option_ToolModeToLinesAndAreasAtEnd)
      Send % OT.ToolMode_LinesAreas
  }

  ;====== CLIPStudioPaint ======================================================
  else if WinActive("ahk_exe CLIPStudioPaint.exe")
  {
    Send {Alt Down} ; Switch to colour picker
    Click           ; Select colour under cursor position
    Send {Alt Up}   ; End of colour picker
    Send % CSP.FillTool_CloseAndFill ; Switch to Close and Fill tool
    Click Down                       ; Start the lasso selection
    KeyWait LButton, Up ; Wait since we're now making a freehand selection
    Click Up            ; Ends the selection and paints it

    ;====== OPTIONS ============================================================
    ; Selects the Normal Fill Tool at end of the command.
    if (CSP.Option_SelectFillToolNormalAtEnd)
      Send % CSP.FillTool_Normal
  }
  return

;===============================================================================
;====== FUNCTIONS ==============================================================
;===============================================================================

; CustomReplace() replaces all modifier keys if written as letters with symbols
; and lowercase letters, e.g. [Ctrl+Alt+Shift+A] becomes [^!+a].
CustomReplace(Input)
{
  ReplaceArray := {"ctrl": "^", "shift": "+", "alt": "!", "+": ""}
  for Old, New in ReplaceArray
    for Key, Value in Input
      ; Change case to lower for improved compatibility with programs
      Input[Key] := StrReplace(ChangeCase(Value, "lower"), Old, New)
  return Input
}

; ChangeCase() changes case of a string.
ChangeCase(String, Mode)
{
  if (Mode = "upper")
    StringUpper, String, String
  if (Mode = "lower")
    StringLower, String, String
  if (Mode = "title")
    StringUpper, String, String, T
  return String
}

;===============================================================================
;====== SCRIPT CONTROL =========================================================
;===============================================================================

!F12::Suspend   ; Alt+F12
^F12::Reload    ; Ctrl+F12
^!F12::ExitApp  ; Ctrl+Alt+F12
