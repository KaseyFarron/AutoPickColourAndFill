<div align="center">
<h1>Auto Pick Colour & Fill</h1>
Auto Pick Colour & Fill is a <a href="https://www.autohotkey.com/">AutoHotkey</a> script that reduces the number of user actions required to paint small unfilled gaps left over by paint bucket tools when working with aliased line work, by picking the colour under the cursor position and initiating a lasso fill selection in a single click.
<br><br>
<img src="https://user-images.githubusercontent.com/55353161/113505841-33d1e400-9539-11eb-9cc5-f84753b405cf.gif"/>
<br><br>
<b>Currently OpenToonz (v1.5+) and CLIP Studio Paint are supported.</b>
<br>
<a href="#how-to-use">How To Use</a> • <a href="#options">Options</a> • <a href="#download">Download</a>
<br>
</div>

***

## How To Use
The script is run with a combination hotkey, the `F9 key` and the `left mouse button`.

You must hold down the `F9 key` to activate the script (_from now on referred to as the_ `Ready Key`), the script will run when you click and drag using the `left mouse button`.

You must setup the following shortcut keys for the script to work in your programs. You may use your own shortcut keys over the default keys listed, but you must edit the `settings.ini` file to match the ones you choose. Please note that the key set for `Ready Key (F9)` will no longer function as a normal key while the script is running.

**OpenToonz (v1.5+)**

| Command       | Shortcut    |
| ----------------- | ------------------- |
| Style Picker Tool - Areas | Shift+K     |
| Fill Tool - Freehand      | Shift+F     |
| Tool Mode - Areas         | Alt+M       |
| Tool Mode - Lines & Areas | Alt+Shift+M |
| Tool Type - Normal        | Shift+N     |

**CLIP Studio Paint**

| Command      | Shortcut |
| ----------------- | ---------------- |
| Colour Picker     | Alt              |
| Close & Fill Tool | F                |
| Normal Fill Tool  | V                |

Please note, the `Normal Fill Tool` refers to the _**sub-tool**_ that you would use for a Normal flood fill, not the icon on the Toolbar, because all Fill Tools are grouped under the Toolbar icon, using the shortcut for the group may fail to switch the commands correctly.

### Script Control
You can control the script globally using the following hotkeys.

| Hotkey | Action |
| --- | --- |
| Ctrl+Alt+F12 | Quit Script |
| Ctrl+F12 | Reload Script |
| Alt+F12 | Suspend Script |

### Options
There are options you can change within the `settings.ini` file prefixed with `option`.

| Option | Default | Description |
| ------ | ------- | ----------- |
| `FillTypeToNormalAtEnd` | On | **OpenToonz**: Switches the **Fill Tool Type** to _**Normal**_ when the mouse is released. |
| `ToolModeToLinesAndAreasAtEnd` | On | **OpenToonz**: Switches the **Tool Mode** to _**Lines & Areas**_ when the mouse is released.
| `SelectFillToolNormalAtEnd` | On | **CLIPStudioPaint**: Switches the tool to _**Normal Fill Tool**_ as corresponding to the shortcut set when the mouse is released.

## Download
You can [download](https://github.com/KaseyFarron/PickColourAndFill/releases) and run the latest self-contained binary for Windows, or the script itself which requires you have [AutoHotkey](https://www.autohotkey.com/) installed to run.
