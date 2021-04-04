------------------------------
Auto Pick Colour & Fill Script
------------------------------

Homepage: https://github.com/KaseyFarron/AutoPickColourAndFill

Description:
For various painting programs, allows in a single click to auto select the
colour under the cursor position and begins a freehand (lasso) selection using
the tool (if available) by the program, reducing the actions required to fill
those small unfilled areas left over by a normal bucket fill.

Created by:
Kasey Farron, 01-03-2021

----------
How To Use
----------
The script is run with a combination hotkey, when the Ready Key (F9) is held and
the mouse or pen button is pressed down.

You must setup the following shortcut keys for the script to work in your
programs. You may use your own shortcut keys over the default keys listed, but
you must edit the settings.ini file to match the ones you choose. Please note
that the key set for Ready Key will no longer function as a normal key while the
script is running.

---------
OpenToonz
---------
Style Picker Tool - Areas       Shift+K
Fill Tool - Freehand            Shift+F
Tool Mode - Areas               Alt+M
Tool Mode - Lines & Areas       Alt+Shift+M
Tool Type - Normal              Shift+N

-----------------
CLIP Studio Paint
-----------------
Colour Picker                   Alt
Close & Fill Tool               F
Normal Fill Tool                V

Please note, the Normal Fill Tool refers to the sub-tool that you would use for
a Normal flood fill, not the icon on the Toolbar, because all Fill Tools are
grouped under the Toolbar icon using the shortcut for the group would may fail
to switch the commands correctly.

--------------
Script Control
--------------
You can control the script globally using the following hotkeys.

Ctrl+Alt+F12                    Quit Script
Ctrl+F12                        Reload Script
Alt+F12                         Suspend Script

-------
Options
-------
There are options you can change within the settings.ini file prefixed with
option.

FillTypeToNormalAtEnd           On  [OpenToonz] Switches the Fill Tool Type to
                                    Normal when the mouse is released.

ToolModeToLinesAndAreasAtEnd    On  [OpenToonz] Switches the Tool Mode to
                                    Lines & Areas when the mouse is released.

SelectFillToolNormalAtEnd	    on  [CLIPStudioPaint] Switches the tool to
                                    Normal Fill Tool as corresponding to the
                                    shortcut set when the mouse is released.                                              
