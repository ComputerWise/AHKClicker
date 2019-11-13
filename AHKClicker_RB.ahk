; GLOBAL SETTINGS ===============================================================================================================

#SingleInstance force
#NoEnv
#InstallMouseHook
#InstallKeybdHook
#UseHook On
DetectHiddenWindows, On
CoordMode, Mouse, Screen
SetWorkingDir %A_ScriptDir%

global IBAnimation := True                                                     ; enable / disable (hover-fade) animation
global IBNames     := ["Home", "Grid 3", "Corel", "Tinkercad", "Settings"]
global IBTabClrStyles := [ [0, 0x8000339b, , 0xD3FFFFFF, 0, , 0x8000339b, 1]   ; normal
                      , [0, 0x80E6E6E6, , 0xD3000000, 0, , 0x80E6E6E6, 1]      ; hover
				      , [0, 0x80CCCCCC, , 0xD3000000, 0, , 0x80CCCCCC, 1]      ; pressed
				      , [0, 0x80F3F3F3, , 0x000078D7, 0, , 0x80F3F3F3, 1] ]    ; disabled (defaulted)
					  
					  
global IBClrStyles := [ [0, 0x8000339b, , 0xD3FFFFFF, 0, , 0x8000339b, 1]      ; normal
                      , [0, 0x80E6E6E6, , 0xD3000000, 0, , 0x80E6E6E6, 1]      ; hover
				      , [0, 0x80CCCCCC, , 0xD3000000, 0, , 0x80CCCCCC, 1]      ; pressed
				      , [0, 0x80F3F3F3, , 0x000078D7, 0, , 0x80F3F3F3, 1] ]    ; disabled (defaulted)

; GUI ===========================================================================================================================

; Create the Gui window, and hide it until needed
	Gui, -AlwaysOnTop -Caption +LastFound -Resize -DPIScale -border,
	WinSet, TransColor, 00339b 
	Gui, Color, 00339b
	
Gui, Margin, 0, 0
Gui, Font, s12, Segoe UI

Gui, Add, Picture, x0 y0 AltSubmit, %A_ScriptDir%\images\HUD_BG.png 

Gui, Add, Button, 30 ym  w100 h30 0x100 hWndhBTN01 gMN_SELECT vMN_TAB_1, % "  " IBNames[1]
ImageButton.Create(hBTN01, IBTabClrStyles*)

Gui, Add, Button, 30 y+0 w100 h30 0x100 hWndhBTN02 gMN_SELECT vMN_TAB_2, % "  " IBNames[2]
ImageButton.Create(hBTN02, IBTabClrStyles*)

Gui, Add, Button, 30 y+0 w100 h30 0x100 hWndhBTN03 gMN_SELECT vMN_TAB_3, % "  " IBNames[3]
ImageButton.Create(hBTN03, IBTabClrStyles*)

Gui, Add, Button, 30 y+0 w100 h30 0x100 hWndhBTN04 gMN_SELECT vMN_TAB_4, % "  " IBNames[4]
ImageButton.Create(hBTN04, IBTabClrStyles*)

Gui, Add, Button, 30 y+0 w100 h30 0x100 hWndhBTN04 gMN_SELECT vMN_TAB_5, % "  " IBNames[5]
ImageButton.Create(hBTN05, IBTabClrStyles*)
				
			;Set initial value of volume bar
			SoundGet, Init
			GuiControl,, MyVol, %Init%

		; Undo and Window Navigation, Bottom Row
			Gui, Add, Picture, x30 y200 gUndo, %A_ScriptDir%\images\HUDLo_Undo.png
			Gui, Add, Picture, x91 y200 gUp, %A_ScriptDir%\images\HUDLo_PgUp.png
			Gui, Add, Picture, x150 y200 gDown,%A_ScriptDir%\images\HUDLo_PgDn.png
			
; Pointer Reference
	Gui, Add, Picture, x8 y08 AltSubmit +BackgroundTrans, %A_ScriptDir%\images\Arrow.png

; Settings
	Gui, Add, Picture, x200 y0 gHide, %A_ScriptDir%\images\Bar_Sett.png
			
; Hide Window
	Gui, Add, Picture, x220 y0 gHide, %A_ScriptDir%\images\Bar_Hide.png

Gui, Add, Tab2, xm ym w0 h0 -Wrap Choose1 AltSubmit vMyMenuTab, % "1|2|3|4|5"
	
Gui, Tab, 1
		gui, Add, Picture, x40 y22 altsubmit +BackGroundTrans gDel, %A_ScriptDir%\images\TabWin_Del.png
		gui, Add, Picture, x95 y22 altsubmit +BackGroundTrans gEnter, %A_ScriptDir%\images\TabWin_Enter.png
		gui, Add, Picture, x150 y22 altsubmit +BackGroundTrans gClosePro, %A_ScriptDir%\images\TabWin_ClosePro.png
		gui, Add, Picture, x40 y82 altsubmit +BackGroundTrans gCopy, %A_ScriptDir%\images\TabWin_Copy.png
		gui, Add, Picture, x95 y82 altsubmit +BackGroundTrans gDrag, %A_ScriptDir%\images\TabWin_Drag.png
		gui, Add, Picture, x150 y82 altsubmit +BackGroundTrans gRight, %A_ScriptDir%\images\TabWin_Right.png
		gui, Add, Picture, x40 y142 altsubmit +BackGroundTrans gPaste, %A_ScriptDir%\images\TabWin_Paste.png
		gui, Add, Picture, x95 y142 altsubmit +BackGroundTrans g2Click, %A_ScriptDir%\images\TabWin_2Click.png
		gui, Add, Picture, x150 y142 altsubmit +BackGroundTrans g3Click, %A_ScriptDir%\images\TabWin_3Click.png

Gui, Tab, 2
Gui, Font, s14 cFFFFFF, Segoe UI
		gui, Add, Picture, x40 y22 altsubmit +BackGroundTrans gEdit, %A_ScriptDir%\images\TabWin_EditF11.png
		gui, Add, Picture, x95 y22 altsubmit +BackGroundTrans gCopy, %A_ScriptDir%\images\TabWin_Copy.png
		gui, Add, Picture, x150 y22 altsubmit +BackGroundTrans gPaste, %A_ScriptDir%\images\TabWin_Paste.png
		gui, Add, Picture, x40 y82 altsubmit +BackGroundTrans gDel, %A_ScriptDir%\images\TabWin_Del.png
		gui, Add, Picture, x95 y82 altsubmit +BackGroundTrans gEnter, %A_ScriptDir%\images\TabWin_Enter.png
		gui, Add, Picture, x150 y82 altsubmit +BackGroundTrans gCLabel, %A_ScriptDir%\images\TabWin_CLabel.png
		gui, Add, Picture, x40 y142 altsubmit +BackGroundTrans gFind, %A_ScriptDir%\images\TabWin_Find.png

Gui, Tab, 3
Gui, Font, s14 cFFFFFF, Segoe UI
		gui, Add, Picture, x40 y22 altsubmit +BackGroundTrans gPick, %A_ScriptDir%\images\TabWin_Pick.png
		gui, Add, Picture, x95 y22 altsubmit +BackGroundTrans gShape, %A_ScriptDir%\images\TabWin_Shape.png
		gui, Add, Picture, x150 y22 altsubmit +BackGroundTrans gRectangle, %A_ScriptDir%\images\TabWin_Rectangle.png
		gui, Add, Picture, x40 y82 altsubmit +BackGroundTrans gEllipse, %A_ScriptDir%\images\TabWin_Ellipse.png
		gui, Add, Picture, x95 y82 altsubmit +BackGroundTrans gTextTool, %A_ScriptDir%\images\TabWin_Text.png
		gui, Add, Picture, x150 y82 altsubmit +BackGroundTrans gPolygon, %A_ScriptDir%\images\TabWin_Polygon.png
		gui, Add, Picture, x40 y142 altsubmit +BackGroundTrans gControlToggle, %A_ScriptDir%\images\TabWin_Ctrl.png
		gui, Add, Picture, x95 y142 altsubmit +BackGroundTrans gShiftClick, %A_ScriptDir%\images\TabWin_ShiftClick.png

Gui, Tab, 4
Gui, Font, s14 cFFFFFF, Segoe UI
		gui, Add, Picture, x40 y22 altsubmit +BackGroundTrans gScrollUp, %A_ScriptDir%\images\TabWin_ScrollUp.png
		gui, Add, Picture, x95 y22 altsubmit +BackGroundTrans gScrollDown, %A_ScriptDir%\images\TabWin_ScrollDown.png
		gui, Add, Picture, x150 y22 altsubmit +BackGroundTrans gShiftClick, %A_ScriptDir%\images\TabWin_ShiftClick.png

Gui, Tab, 5
Gui, Font, s14 cFFFFFF, Segoe UI
Gui, Add, Text, xm ym w250 h250, % "  " IBNames[4]
; Mouse Speed controls on Left Edge
			Gui, Add, Picture, x10 y25 GFast altsubmit, %A_ScriptDir%\images\HUDL_Fast.png
			Gui, Add, Picture, x10 y85 GMed altsubmit, %A_ScriptDir%\images\HUDL_Med.png
			Gui, Add, Picture, x10 y145 GSlow altsubmit, %A_ScriptDir%\images\HUDL_Slow.png

		; Vol Controls on Right Edge
			Gui, Add, Picture, x40 y25 altsubmit gLevUp,  %A_ScriptDir%\images\Vol_Up.png 
			Gui, Add, Progress, x70 y28 w23 h177 c6666FF Background003399 vertical Range0-100 vMyVol
			Gui, Add, Picture, x40 y61 altsubmit gLev3,  %A_ScriptDir%\images\Vol_3.png
			Gui, Add, Picture, x40 y97 altsubmit gLev2, %A_ScriptDir%\images\Vol_2.png
			Gui, Add, Picture, x40 y133 altsubmit gLev1, %A_ScriptDir%\images\Vol_1.png
			Gui, Add, Picture, x40 y169 altsubmit gLevDown, %A_ScriptDir%\images\Vol_Down.png

SystemParametersInfo(IBAnimation)
Gui, hide

; Get edges of desktop to aid placement of GUI
SysGet, Edges, MonitorWorkArea
State=0

; ACTIVATION ====================================================================================================================

f8::Suspend

RButton::

State:=!State

	If State
	{
	MouseGetPos, oX, oY, WinId
		Gosub, GetGui	
		Gui, Show, x%xPos% y%yPos%
		MouseMove, (xPos+120), (yPos+115), 0		
	}
	else
	{
	MouseGetPos, mX, mY, WinId
	if((mX >= xPos && mX <= (xPos+240)) && (mY >= yPos && mY <= (yPos+130)))
	{
	send {click}
	}
	else
	{
	Gui, Hide		
	}
	}
return

LButton::
	if dragging
	{
		dragging := 0
		KeyWait, LButton
		Sleep, 100
		Send {LButton Up} 
	}
	else
	{
	send {click}
	}
return
	

; SCRIPT ========================================================================================================================

MN_SELECT:
    GuiControl, Choose, MyMenuTab, % k := SubStr(A_GuiControl, 8)

    loop % IBNames.MaxIndex() {
        if (k = A_Index)
            GuiControl, Disable, MN_TAB_%A_Index%
		else
            GuiControl, Enable, MN_TAB_%A_Index%
	}
return

; FUNCTIONS =====================================================================================================================

CtlColorBtns()                                    ; https://github.com/jNizM/AHK_Scripts/blob/master/src/gui/GUI_CtlColorBtns.ahk
{
    static init := OnMessage(0x0135, "CtlColorBtns")
    return DllCall("gdi32\CreateSolidBrush", "uint", 0xFFFFFF, "uptr")
}

SystemParametersInfo(toggle := 0)                               ; https://msdn.microsoft.com/en-us/library/ms724947(v=vs.85).aspx
{
    static SPI_SETCLIENTAREAANIMATION := 0x1043
    if !(DllCall("user32\SystemParametersInfo", "uint", SPI_SETCLIENTAREAANIMATION, "uint", 0, "int", toggle, "uint", 0))
        throw Exception("SystemParametersInfo failed: " A_LastError, -1)
    return true
}

; Show GUI at mouse coordinates, unless too near edge of screen.
	GetGui:
		if (oX < 10)
		{
			xPos := oX 
		}
		else if (oX > (EdgesRight-315))
		{
			xPos := EdgesRight-315
		}
		else
		{
			xPos := oX-10
		}
		if (oY <10)
		{
			yPos := oY
		}
			else if (oY > (EdgesBottom-230))
		{
			yPos := EdgesBottom-230
		}
		else
		{
			yPos := oY-10
		}
	return
	
; TAB 1 

; Buttons

	; Mouse Speed Controls
		Fast:
			Gui, Hide
			State:=!State
			DllCall("SystemParametersInfo", UInt, 0x71, UInt, 0, UInt, 15, UInt, 0) 
		return

		Med:
			Gui, Hide
			State:=!State
			DllCall("SystemParametersInfo", UInt, 0x71, UInt, 0, UInt, 12, UInt, 0) 
		return

		Slow:
			Gui, Hide
			DllCall("SystemParametersInfo", UInt, 0x71, UInt, 0, UInt, 3, UInt, 0) 
		return


; Volume Controls
		LevUp:
			SoundSet +5
			SoundGet, Curr
			GuiControl,, MyVol, %Curr%
		return

		LevDown:
			SoundSet -5
			SoundGet, Curr
			GuiControl,, MyVol, %Curr%
		return

		Lev1:
			SoundSet, 30
			SoundGet, Curr
			GuiControl,, MyVol, %Curr%	
		return

		Lev2:
			SoundSet, 45
			SoundGet, Curr
			GuiControl,, MyVol, %Curr%	
		return

		Lev3:
			SoundSet, 60
			SoundGet, Curr
			GuiControl,, MyVol, %Curr%	
		return


; Undo and PageNav

		Undo:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Sleep, 20
			Send, ^z
		return

		Up:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send, {PgUp}
		return

		Down:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send, {Pgdn}
		return


; Close Gui, and Settings
		Hide:
			Gui, Hide
			State:=!State
		return

		Settings:
		return 


; Windows Tab
		Del:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send, {Delete}
		Return

		Enter:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send, {Enter}
		Return

		ClosePro:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Sleep, 20
			Send, !{F4}
		Return
		

		Copy:
			Gui, Hide
			State:=!State
			Send, ^c
		return
	
		Drag:
			dragging := 1
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			MouseMove, %oX%, %oY%, 0
			Sleep, 100
			Send {LButton Down}
		return

		Right:
			Sleep, 300
			Gui, Hide
			State:=!State
			Send {Click, %oX%, %oY%, Right}
		return

		
		Paste:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send, ^v
		Return

		2Click:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send, {Click, %oX%, %oY%, 2}
		Return

		3Click:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send, {Click, %oX%, %oY%, 3}
		Return
		
		Read:
;			ClipSave := clipboard
			clipboard := ""
			Send ^c
			ClipWait, 0.5
			ToSay := clipboard
			ComObjCreate("SAPI.SpVoice").Speak(ToSay)
;			clipboard := ClipSave
		return
		
; TAB 2

		Edit:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send, {F11}
		return
		
		CLabel:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send, {F2}
		return
		
		Find:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send, ^f
		return

; TAB 3

		Pick:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send, {Space}
		return
		
		Shape:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send, {F10}
		return
		
		Rectangle:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send, {F6}
		return
		
		Ellipse:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send, {F7}
		return
		
		Polygon:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send, y
		return
		
		TextTool:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send, t
		return
		
		ControlToggle:
			if ControlTog
				{
					Send {Control Up}
					ControlTog := 0
				}else{
					Send {Control Down}
					ControlTog := 1
				}
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
		return

; TAB 4
		ScrollUp:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send  {WheelUp}
		return

		ScrollDown:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send  {WheelDown}
		return

		ShiftClick:
			Gui, Hide
			State:=!State
			WinActivate, ahk_id %WinId%
			Send {Shift down}
			Send {Click, %oX%, %oY%}
			Send {Shift up}
		return

; INCLUDES ======================================================================================================================

#Include Class_ImageButton.ahk                                  ; https://github.com/AHK-just-me/Class_ImageButton

; EXIT ==========================================================================================================================

GuiClose:
GuiEscape:
ExitApp

; ===============================================================================================================================