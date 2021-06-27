#Persistent
#NoEnv
#SingleInstance force
#Include <DeepLDesktop>
#Include <SQLiteDB>
#Include <classMemory>
#Include <dqMemRead>
SendMode Input

;=== Load Start GUI settings from file ======================================
IniRead, Language, settings.ini, general, Language, en
IniRead, Log, settings.ini, general, Log, 0
IniRead, JoystickEnabled, settings.ini, general, JoystickEnabled, 0
IniRead, ResizeOverlay, settings.ini, overlay, ResizeOverlay, 0
IniRead, AutoHideOverlay, settings.ini, overlay, AutoHideOverlay, 0
IniRead, ShowOnTaskbar, settings.ini, overlay, ShowOnTaskbar, 0
IniRead, OverlayWidth, settings.ini, overlay, OverlayWidth, 930
IniRead, OverlayHeight, settings.ini, overlay, OverlayHeight, 150
IniRead, OverlayColor, settings.ini, overlay, OverlayColor, 000000
IniRead, FontColor, settings.ini, overlay, FontColor, White
IniRead, FontSize, settings.ini, overlay, FontSize, 16
IniRead, FontType, settings.ini, overlay, FontType, Arial
IniRead, OverlayPosX, settings.ini, overlay, OverlayPosX, 0
IniRead, OverlayPosY, settings.ini, overlay, OverlayPosY, 0
IniRead, OverlayTransparency, settings.ini, overlay, OverlayTransparency, 255
IniRead, ShowFullDialog, settings.ini, advanced, ShowFullDialog, 0
IniRead, HideDeepL, settings.ini, advanced, HideDeepL, 0

;=== Create Start GUI =======================================================
Gui, 1:Default
Gui, Font, s10, Segoe UI
Gui, Add, Tab3,, General|Overlay Settings|Advanced|Help|About
Gui, Add, Link,, <a href="https://github.com/jmctune/ahkmon_desktop/wiki/General-tab">General Settings Documentation</a>
Gui, Add, Text,, ahkmon: Automate your DQX text translation.
Gui, Add, Picture, w375 h206, imgs/dqx_logo.png
Gui, Add, Link,, Language you want to translate text to:`n<a href="https://www.andiamo.co.uk/resources/iso-language-codes/">Regional Codes</a>
Gui, Add, DDL, vLanguage, %Language%||bg|cs|da|de|el|en|es|et|fi|fr|hu|it|lt|lv|nl|pl|pt|ro|ru|sk|sl|sv|zh
Gui, Add, CheckBox, vLog Checked%Log%, Enable logging to file?
Gui, Add, CheckBox, vJoystickEnabled Checked%JoystickEnabled%, Do you play with a controller?
Gui, Add, Button, gSave, Run ahkmon

;; Overlay settings tab
Gui, Tab, Overlay Settings
Gui, Add, Link,, <a href="https://github.com/jmctune/ahkmon_desktop/wiki/Overlay-Settings-tab">Overlay Settings Documentation</a>
Gui, Add, Text,, F12 will turn the overlay on/off.
Gui, Add, CheckBox, vResizeOverlay Checked%ResizeOverlay%, Allow resize of overlay?
Gui, Add, CheckBox, vAutoHideOverlay Checked%AutoHideOverlay%, Automatically hide overlay?
Gui, Add, CheckBox, vShowOnTaskbar Checked%ShowOnTaskbar%, Show overlay on taskbar when active?
Gui, Add, Text,, Overlay transparency (lower = more transparent):
Gui, Add, Slider, vOverlayTransparency Range10-255 TickInterval3 Page3 Line3 Tooltip, %OverlayTransparency%
Gui, Add, Text, vOverlayColorInfo, Overlay background color (use hex color codes):
Gui, Add, ComboBox, vOverlayColor, %OverlayColor%||
Gui, Add, Text, vOverlayWidthInfo, Initial overlay width:
Gui, Add, Edit
Gui, Add, UpDown, vOverlayWidth Range100-2000, %OverlayWidth%
Gui, Add, Text, vOverlayHeightInfo, Initial overlay height:
Gui, Add, Edit
Gui, Add, UpDown, vOverlayHeight Range100-2000, %OverlayHeight%
Gui, Add, Text, vFontColorInfo, Overlay font color:
Gui, Add, ComboBox, vFontColor, %FontColor%||Yellow|Red|Green|Blue|Black|Gray|Maroon|Purple|Fuchsia|Lime|Olive|Navy|Teal|Aqua
Gui, Add, Text,, Overlay font size:
Gui, Add, Edit
Gui, Add, UpDown, vFontSize Range8-30, %FontSize%
Gui, Add, Text, vFontInfo, Select a font or enter a custom font available`n on your system to use with the overlay:
Gui, Add, ComboBox, vFontType, %FontType%||Calibri|Consolas|Courier New|Inconsolata|Segoe UI|Tahoma|Times New Roman|Trebuchet MS|Verdana

;; Advanced tab
Gui, Tab, Advanced
Gui, Add, Link,, <a href="https://github.com/jmctune/ahkmon_desktop/wiki/Advanced-tab">Advanced Settings Documentation</a>
Gui, Add, Text,, This tab is for users that struggle with the default settings.
Gui, Add, CheckBox, vShowFullDialog Checked%ShowFullDialog%, Show all text at once instead of line by line?
Gui, Add, CheckBox, vHideDeepL Checked%HideDeepL%, Hide DeepL?
Gui, Add, Button, gResetDeepLPosition, Reset DeepL Position

;; Help tab
Gui, Tab, Help
Gui, Add, Link,, <a href="https://github.com/jmctune/ahkmon_desktop/wiki/Troubleshooting">Troubleshooting ahkmon</a>

;; About tab
Gui, Tab, About
Gui, Add, Link,, Join the unofficial Dragon Quest X <a href="https://discord.gg/UFaUHBxKMY">Discord</a>!
Gui, Add, Link,, <a href="https://github.com/jmctune/ahkmon_desktop">Get the Source</a>
Gui, Add, Link,, <a href="https://github.com/jmctune/ahkmon_desktop/wiki">Documentation</a>
Gui, Add, Link,, Like what I'm doing? <a href="https://www.paypal.com/paypalme/supportjmct">Donate :P</a>
Gui, Add, Text,, Catch me on Discord: mebo#1337
Gui, Add, Text,, Made by Serany <3
Gui, Add, Text,, `n`n`nNOTE: This version of ahkmon is standalone`nfrom the current active version. I will`nnot be providing regular updates to this version.`nIt exists for users who don't want to`nsign up for DeepL's API service and want to continue`nusing the DeepL desktop client.`n`nIf you want the newest features, I'd suggest figuring out`na way to get a free DeepL Developer account.

;;=== Misc Start GUI ========================================================
Gui, Show, Autosize
Return

ResetDeepLPosition:
  WinMove, DeepL,, 0, 0
  return

;; What to do when the app is gracefully closed
GuiEscape:
GuiClose:
  ExitApp

;=== Save Start GUI settings to ini ==========================================
Save:
  Gui, Submit, Hide
  IniWrite, %Language%, settings.ini, general, Language
  IniWrite, %Log%, settings.ini, general, Log
  IniWrite, %ShowOnTaskbar%, settings.ini, overlay, ShowOnTaskbar
  IniWrite, %JoystickEnabled%, settings.ini, general, JoystickEnabled
  IniWrite, %OverlayWidth%, settings.ini, overlay, OverlayWidth
  IniWrite, %OverlayHeight%, settings.ini, overlay, OverlayHeight
  IniWrite, %OverlayColor%, settings.ini, overlay, OverlayColor
  IniWrite, %ResizeOverlay%, settings.ini, overlay, ResizeOverlay
  IniWrite, %AutoHideOverlay%, settings.ini, overlay, AutoHideOverlay
  IniWrite, %FontColor%, settings.ini, overlay, FontColor
  IniWrite, %FontSize%, settings.ini, overlay, FontSize
  IniWrite, %FontType%, settings.ini, overlay, FontType
  IniWrite, %OverlayTransparency%, settings.ini, overlay, OverlayTransparency
  IniWrite, %ShowFullDialog%, settings.ini, advanced, ShowFullDialog
  IniWrite, %HideDeepL%, settings.ini, advanced, HideDeepL

;=== Keys to press to trigger dialog to continue =============================
;; Detect joystick
if (JoystickEnabled = 1)
{
  Loop 16  ; Query each joystick number to find out which ones exist.
    {
      GetKeyState, JoyName, %A_Index%JoyName
      if JoyName <>
      {
        JoystickNumber = %A_Index%
        break
      }
    }
    if JoystickNumber <= 0
    {
      MsgBox Could not find a valid joystick. Enabling ShowFullDialog instead.
      ShowFullDialog := 1
      IniWrite, %ShowFullDialog%, settings.ini, advanced, ShowFullDialog
    }
}

KeyboardKeys := "Enter,Esc,Up,Down,Left,Right"

;; Maps 1Joy1, 1Joy2, etc for the correct controller number that was found.
loop 32
  JoystickKeys .= JoystickNumber . "Joy" . A_Index . ","

;=== Global vars we'll be using elsewhere ====================================
Global Log
Global Language
Global FontType
Global FontColor
Global HideDeepL
Global JoystickEnabled
Global JoystickKeys
Global KeyboardKeys
Global newOverlayWidth
Global newOverlayHeight
Global AutoHideOverlay
Global OverlayHeight
Global alteredOverlayWidth
Global ShowFullDialog

;=== Open overlay ============================================================
overlayShow = 1
alteredOverlayWidth := OverlayWidth - 37
Gui, 2:Default
Gui, Color, %OverlayColor%  ; Sets GUI background to black
Gui, Font, s%FontSize% c%FontColor%, %FontType%

if (ShowFullDialog = 1)
  Gui, Add, Edit, -E0x200 +0x0 vClip +ReadOnly -WantCtrlA -WantReturn -WantTab +BackgroundTrans -Border h%OverlayHeight% w%alteredOverlayWidth%
else
  Gui, Add, Text, +0x0 vClip h%OverlayHeight% w%alteredOverlayWidth%
  
Gui, Show, w%OverlayWidth% h%OverlayHeight% x%OverlayPosX% y%OverlayPosY%
Winset, Transparent, %OverlayTransparency%, A
Gui, +LastFound

OnMessage(0x201,"WM_LBUTTONDOWN")  ; Allows dragging the window

flags := "-caption +alwaysontop -Theme -DpiScale -Border "

if (ResizeOverlay = 1)
  customFlags := "+Resize -MaximizeBox "

if (ShowOnTaskbar = 0) 
  customFlags .= "+ToolWindow "
else
  customFlags .= "-ToolWindow "

Gui, % flags . customFlags

;=== Miscellaneous functions =================================================
WM_LBUTTONDOWN(wParam,lParam,msg,hwnd) {
  PostMessage, 0xA1, 2
  Gui, 2:Default
  WinGetPos, newOverlayX, newOverlayY, newOverlayWidth, newOverlayHeight, A
  GuiControl, MoveDraw, Clip, % "w" newOverlayWidth-31 "h" newOverlayHeight-38  ; Prefer redrawing on move rather than at the end as text gets distorted otherwise
  WinGetPos, newOverlayX, newOverlayY, newOverlayWidth, newOverlayHeight, A
  IniWrite, %newOverlayX%, settings.ini, overlay, OverlayPosX
  IniWrite, %newOverlayY%, settings.ini, overlay, OverlayPosY
}

;; Controller/Keyboard function to progress text
GetKeyPress(keyStr) {
  keys := StrSplit(keyStr, ",")
  loop
    for each, key in keys
      if GetKeyState(key)
      {
        KeyWait, %key%
        return key
      }
}

;=== Start DQ memread ========================================================
dqMemRead()
