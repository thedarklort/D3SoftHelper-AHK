;=========================================================================
;                                                                        ;
; D3 Soft Helper                                                         ;
;                                                                        ;
; Created by Timer, Violicious and f3ary                                 ;
;                                                                        ;
;   https://discord.gg/UnnY5UY                                           ;
;                                                                        ;
; Last Update: by Timer 2019-10-15 10:20 GMT+1                           ;
;                                                                        ;
;                                                                        ;
;=========================================================================
#SingleInstance Force
#NoEnv
;#Warn
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
SendMode Input
#Persistent

;------------ VERSION ------------

Global Version := "1.0"
CheckNewVersion()   ;Comment out or Delete this line if you dont want the Script to notify you on a new Update

;------------ VARIABLES ------------
global Hotkeys := "q|w|e|r|t|z|u|i|o|p|a|s|d|f|g|h|j|k|l|y|x|c|v|b|n|m|1|2|3|4|5|6|7|8|9|0|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|LButton|RButton|Space|Shift|XButton1|XButton2"
global MantraHK
global EphiphanyHK
global SancHK
global ZephyrHK
global DeadlyReachHK
global TsunamiHK
global EnableDisableHK
global StayWizHK
global BossHK
global ExitAppHK
global StandStillHK
global ShoutHK
global IPHK
global SprintHK
global WarcryHK
global BerserkHK
global LotDHK
global DevourHK
global BoneArmorHK
global SimulacrumHK
global CommSkellHK
global StartStopHK
global Constant_toggle
global StayWizToggle
global ToggleBoss
global MetaBarb
global zBarb
global zBarbBers
global LonNec
global zNec
global MetaBarbToggle
global NecToggle
global SecondSim
global MonkMoveToggle

;------------ INI READ ------------
IniRead, MantraHK, Settings.ini, Settings, MantraHK, 1
IniRead, EphiphanyHK, Settings.ini, Settings, EphiphanyHK, 2
IniRead, ZephyrHK, Settings.ini, Settings, ZephyrHK, 3
IniRead, SancHK, Settings.ini, Settings, SancHK, 4
IniRead, DeadlyReachHK, Settings.ini, Settings, DeadlyReachHK, RButton
IniRead, TsunamiHK, Settings.ini, Settings, TsunamiHK, LButton
IniRead, EnableDisableHK, Settings.ini, Settings, EnableDisableHK, F6
IniRead, StayWizHK, Settings.ini, Settings, StayWizHK, F2
IniRead, BossHK, Settings.ini, Settings, BossHK, F3
IniRead, ExitAppHK, Settings.ini, Settings, ExitAppHK, F12
IniRead, StandStillHK, Settings.ini, Settings, StandStillHK, Shift
IniRead, ShoutHK, Settings.ini, Settings, ShoutHK, 1
IniRead, IPHK, Settings.ini, Settings, IPHK, 2
IniRead, SprintHK, Settings.ini, Settings, SprintHK, 3
IniRead, WarcryHK, Settings.ini, Settings, WarcryHK, 4
IniRead, BerserkHK, Settings.ini, Settings, BerserkHK, RButton
IniRead, LotDHK, Settings.ini, Settings, LotDHK, 1
IniRead, DevourHK, Settings.ini, Settings, DevourHK, 2
IniRead, BoneArmorHK, Settings.ini, Settings, BoneArmorHK, 3
IniRead, SimulacrumHK, Settings.ini, Settings, SimulacrumHK, 4
IniRead, CommSkellHK, Settings.ini, Settings, CommSkellHK, RButton
IniRead, StartStopHK, Settings.ini, Settings, StartStopHK, F1
IniRead, SecondSim, Settings.ini, Settings, SecondSim, 0

HotKey, %StartStopHK%, StartStop
HotKey, %EnableDisableHK%, EnableDisable
HotKey, %StayWizHK%, StayWiz
HotKey, %BossHK%, Boss
HotKey, %ExitAppHK%, ExitAppFunc


HotKey, %StartStopHK%, Off
HotKey, %StayWizHK%, Off
HotKey, %BossHK%, Off
HotKey, %ExitAppHK%, Off

;------------ GUI LAYOUT ------------
Gui -MinimizeBox -MaximizeBox

;------------ TEXT ------------
Gui Add, Text, x16 y24 w52 h23 +0x200, Mantra
Gui Add, Text, x16 y48 w57 h24 +0x200, Ephiphany
Gui Add, Text, x16 y72 w56 h24 +0x200, Sanc
Gui Add, Text, x16 y96 w55 h23 +0x200, Zephyr
Gui Add, Text, x16 y120 w69 h23 +0x200, DeadlyReach
Gui Add, Text, x16 y144 w71 h23 +0x200, Tsunami
Gui Add, Text, x240 y24 w74 h23 +0x200, Enable/Disable
Gui Add, Text, x16 y168 w43 h23 +0x200, StayWiz
Gui Add, Text, x16 y192 w33 h23 +0x200, Boss
Gui Add, Text, x240 y96 w75 h23 +0x200, ExitApp
Gui Add, Text, x16 y288 w39 h23 +0x200, Shout
Gui Add, Text, x16 y312 w38 h23 +0x200, IP
Gui Add, Text, x16 y336 w38 h23 +0x200, Sprint
Gui Add, Text, x16 y360 w45 h23 +0x200, WarCry
Gui Add, Text, x16 y384 w46 h23 +0x200, Berserk
Gui Add, Text, x240 y48 w75 h23 +0x200, ForceStandStill
Gui Add, Text, x240 y288 w57 h23 +0x200, LotD
Gui Add, Text, x240 y312 w56 h23 +0x200, Devour
Gui Add, Text, x240 y336 w59 h23 +0x200, Bone Armor
Gui Add, Text, x240 y360 w59 h23 +0x200, Simulacrum
Gui Add, Text, x240 y384 w70 h23 +0x200, Com. Skelleton
Gui Add, Text, x240 y72 w73 h23 +0x200, Start/Stop

;------------ DROPDOWNLISTS ------------
Gui Add, DropDownList, vMantraHK x96 y24 w120  +Uppercase, %Hotkeys%|%MantraHK%||
Gui Add, DropDownList, vEphiphanyHK x96 y48 w120  +Uppercase, %Hotkeys%|%EphiphanyHK%||
Gui Add, DropDownList, vSancHK x96 y72 w120  +Uppercase, %Hotkeys%|%SancHK%||
Gui Add, DropDownList, vZephyrHK x96 y96 w120  +Uppercase, %Hotkeys%|%ZephyrHK%||
Gui Add, DropDownList, vDeadlyReachHK x96 y120 w120  +Uppercase, %Hotkeys%|%DeadlyReachHK%||
Gui Add, DropDownList, vTsunamiHK x96 y144 w120  +Uppercase, %Hotkeys%|%TsunamiHK%||
Gui Add, DropDownList, vEnableDisableHK x328 y24 w120  +Uppercase, %Hotkeys%|%EnableDisableHK%||
Gui Add, DropDownList, vStayWizHK x96 y168 w120  +Uppercase, %Hotkeys%|%StayWizHK%||
Gui Add, DropDownList, vBossHK x96 y192 w120  +Uppercase, %Hotkeys%|%BossHK%||
Gui Add, DropDownList, vExitAppHK x328 y96 w120  +Uppercase, %Hotkeys%|%ExitAppHK%||
Gui Add, DropDownList, vStandStillHK x328 y48 w120  +Uppercase, %Hotkeys%|%StandStillHK%||
Gui Add, DropDownList, vShoutHK x96 y288 w120  +Uppercase, %Hotkeys%|%ShoutHK%||
Gui Add, DropDownList, vIPHK x96 y312 w120  +Uppercase, %Hotkeys%|%IPHK%||
Gui Add, DropDownList, vSprintHK x96 y336 w120  +Uppercase, %Hotkeys%|%SprintHK%||
Gui Add, DropDownList, vWarcryHK x96 y360 w120  +Uppercase, %Hotkeys%|%WarcryHK%||
Gui Add, DropDownList, vBerserkHK x96 y384 w120  +Uppercase, %Hotkeys%|%BerserkHK%||
Gui Add, DropDownList, vLotDHK x328 y288 w120  +Uppercase, %Hotkeys%|%LotDHK%||
Gui Add, DropDownList, vDevourHK x328 y312 w120  +Uppercase, %Hotkeys%|%DevourHK%||
Gui Add, DropDownList, vBoneArmorHK x328 y336 w120  +Uppercase, %Hotkeys%|%BoneArmorHK%||
Gui Add, DropDownList, vSimulacrumHK x328 y360 w120  +Uppercase, %Hotkeys%|%SimulacrumHK%||
Gui Add, DropDownList, vCommSkellHK x328 y384 w120  +Uppercase, %Hotkeys%|%CommSkellHK%||
Gui Add, DropDownList, vStartStopHK x328 y72 w120  +Uppercase, %Hotkeys%|%StartStopHK%||

;------------ GROUPBOXES ------------
Gui Add, GroupBox, x232 y0 w226 h247, General
Gui Add, GroupBox, x8 y0 w213 h247, Monk
Gui Add, GroupBox, x8 y256 w214 h168, Barb
Gui Add, GroupBox, x232 y256 w225 h167, Necro

;------------ RADIOBUTTONS ------------
Gui Add, Radio, vMonkRB x160 y432 w66 h23 +Checked, Monk
Gui Add, Radio, vBarbRB x160 y456 w64 h23, Barb
Gui Add, Radio, vNecroRB x160 y480 w65 h23, Necro

;------------ CHECKBOXES -----------------
Gui Add, CheckBox, vHotKeysActive x16 y480 w120 h22 +Disabled, Hotkeys Active
Gui Add, CheckBox, vSecondSim x240 y144 w76 h23 checked%SecondSim%, Second Sim

Gui Add, Radio, vMetaBarb x232 y456 w46 h23 +Checked, Meta
Gui Add, Radio, vzBarb x280 y456 w51 h23, zBarb
Gui Add, Radio, vzBarbBers x336 y456 w70 h23, zBarb Bers

;------------ BUTTONS ---------------------
Gui Add, Button, gSave x8 y432 w80 h23, Save
Gui Add, Button, gDiscord x240 y180 w80 h25, Discord

;------------- RADIO GROUP 2 --------------
Gui Add, Radio, vLonNec x232 y480 w79 h23 +Checked, LoN Mages
Gui Add, Radio, vzNec x312 y480 w84 h23, zNec

Gui Add, StatusBar,, by Timer, f3ary and Violicious | Version: %Version%

Gui Show, w470 h530, D3 Soft Helper
Return

Save(CtrlHwnd, GuiEvent, EventInfo, ErrLevel := "") {

GuiControlGet, MantraHK
GuiControlGet, EphiphanyHK
GuiControlGet, SancHK
GuiControlGet, ZephyrHK
GuiControlGet, DeadlyReachHK
GuiControlGet, TsunamiHK
GuiControlGet, EnableDisableHK
GuiControlGet, StayWizHK
GuiControlGet, BossHK
GuiControlGet, ExitAppHK
GuiControlGet, StandStillHK
GuiControlGet, ShoutHK
GuiControlGet, IPHK
GuiControlGet, SprintHK
GuiControlGet, WarcryHK
GuiControlGet, BerserkHK
GuiControlGet, LotDHK
GuiControlGet, DevourHK
GuiControlGet, BoneArmorHK
GuiControlGet, SimulacrumHK
GuiControlGet, CommSkellHK
GuiControlGet, StartStopHK
GuiControlGet, SecondSim

IniWrite %MantraHK%, Settings.ini, Settings, MantraHK
IniWrite %EphiphanyHK%, Settings.ini, Settings, EphiphanyHK
IniWrite %ZephyrHK%, Settings.ini, Settings, ZephyrHK
IniWrite %SancHK%, Settings.ini, Settings, SancHK
IniWrite %DeadlyReachHK%, Settings.ini, Settings, DeadlyReachHK
IniWrite %TsunamiHK%, Settings.ini, Settings, TsunamiHK
IniWrite %EnableDisableHK%, Settings.ini, Settings, EnableDisableHK
IniWrite %StayWizHK%, Settings.ini, Settings, StayWizHK
IniWrite %BossHK%, Settings.ini, Settings, BossHK
IniWrite %ExitAppHK%, Settings.ini, Settings, ExitAppHK
IniWrite %StandStillHK%, Settings.ini, Settings, StandStillHK
IniWrite %ShoutHK%, Settings.ini, Settings, ShoutHK
IniWrite %IPHK%, Settings.ini, Settings, IPHK
IniWrite %SprintHK%, Settings.ini, Settings, SprintHK
IniWrite %WarcryHK%, Settings.ini, Settings, WarcryHK
IniWrite %BerserkHK%, Settings.ini, Settings, BerserkHK
IniWrite %LotDHK%, Settings.ini, Settings, LotDHK
IniWrite %DevourHK%, Settings.ini, Settings, DevourHK
IniWrite %BoneArmorHK%, Settings.ini, Settings, BoneArmorHK
IniWrite %SimulacrumHK%, Settings.ini, Settings, SimulacrumHK
IniWrite %CommSkellHK%, Settings.ini, Settings, CommSkellHK
IniWrite %StartStopHK%, Settings.ini, Settings, StartStopHK
IniWrite %SecondSim%, Settings.ini, Settings, SecondSim

HotKey, %StartStopHK%, StartStop
HotKey, %EnableDisableHK%, EnableDisable
HotKey, %StayWizHK%, StayWiz
HotKey, %BossHK%, Boss
HotKey, %ExitAppHK%, ExitAppFunc

}

Discord:
{
    run % "https://discord.gg/UnnY5UY"
    Return
}



GuiEscape:
GuiClose:
    ExitApp


StartStop:
{
    GuiControlGet, MonkRB
    GuiControlGet, BarbRB
    GuiControlGet, NecroRB
    GuiControlGet, MetaBarb
    GuiControlGet, zBarb
    GuiControlGet, zBarbBers
    GuiControlGet, LonNec
    GuiControlGet, zNec
    IF(MonkRB)
    {
        MonkStartStop()
        Return
    }
    IF(BarbRB)
    {
        If(MetaBarb)
            MetaBarb()
        If(zBarb)
            zBarb()
        If(zBarbBers)
            zBarbBers()
        Return
    }
    IF(NecroRB)
    {
        If(LonNec)
            LonNec()
        If(zNec)
            zNec()
        Return
    }
   
    Return
}

EnableDisable:
{
    GuiControlGet, HotKeysActive
    If(HotKeysActive)
    {
        HotKey, %StartStopHK%, Off
        HotKey, %StayWizHK%, Off
        HotKey, %BossHK%, Off
        HotKey, %ExitAppHK%, Off
        GuiControl,, HotKeysActive, 0
    }
    Else
    {
        HotKey, %StartStopHK%, On
        HotKey, %StayWizHK%, On
        HotKey, %BossHK%, On

        HotKey, %ExitAppHK%, On 
        GuiControl,, HotKeysActive, 1
    }
    Return
}

StayWiz:
{
    StayWiz()
    Return
}

Boss:
{
    Boss()
    Return
}


MonkStartStop()
{
    StayWizToggle := False
    ToggleBoss := False
    AllTimersOff()
    MonkMoveToggle:=!MonkMoveToggle
	SetTimer, epiph,	% (MonkMoveToggle) ? 1200 : "Off"
	SetTimer, mantra,	% (MonkMoveToggle) ? 100 : "Off"
	SetTimer, zephyr,	% (MonkMoveToggle) ? 150 : "Off"     
    Return
}

StayWiz()
{
    MonkMoveToggle := False
    ToggleBoss := False
    AllTimersOff()
    StayWizToggle := !StayWizToggle
    ToggleStandStill(StayWizToggle)
	;;gosub offScreenMouse ;remove this to turn off the mouse move
	Send, +{%SancHK%}
	SetTimer, punch,	% (StayWizToggle) ? 50 : "Off"
	SetTimer, zephyr,	% (StayWizToggle) ? 200 : "Off"
	SetTimer, sanc,		% (StayWizToggle) ? 400 : "Off"
	SetTimer, mantra,	% (StayWizToggle) ? 100 : "Off"
	SetTimer, epiph,	% (StayWizToggle) ? 250 : "Off"
	return
}


Boss()
{
    AllTimersOff()
    StayWizToggle := False
    MonkMoveToggle := False
    ToggleBoss:=!ToggleBoss
	ToggleStandStill(ToggleBoss)
	;;gosub offScreenMouse ;remove this to turn off the mouse move
	Send, +{%SancHK%}
	SetTimer, DeadlyReach,	% (ToggleBoss) ? 50 : "Off"
	SetTimer, sanc,	% (ToggleBoss) ? 400 : "off"
	SetTimer, zephyr,	% (ToggleBoss) ? 250 : "Off"
	SetTimer, mantra,	% (ToggleBoss) ? 100 : "Off"
	SetTimer, epiph,	% (ToggleBoss) ? 250 : "Off"
}


AllTimersOff()
{
  	SetTimer, DeadlyReach,	% (ToggleBoss) ? 50 : "Off"
	SetTimer, sanc, off
	SetTimer, zephyr, off
	SetTimer, mantra, off
	SetTimer, epiph, off
    SetTimer, punch, off
}


ToggleStandStill(Toggled)
{
    IF(Toggled)
    {
        If !GetKeyState(StandStillHK)
        {
            send, +{%StandStillHK%, DOWN}
        }
        Else
        {
            send, +{%StandStillHK%, UP}
        }
    }
    Else
    IF GetKeyState(StandStillHK)
    {
        send, +{%StandStillHK%, UP}
    }
}

epiph:
	send, +{%EphiphanyHK%}
	return
mantra:
	send, +{%MantraHK%}
    return
zephyr:
	send, +{%ZephyrHK%}
    return
punch:
    send, +{%TsunamiHK%}
    Return
DeadlyReach:
    Send, +{%DeadlyReachHK%}
    Return
Sanc:
    Send, +{%SancHK%}
    Return

MetaBarb()
{
	MetaBarbToggle := !MetaBarbToggle
	SetTimer, ThreateningShout,			% (MetaBarbToggle) ? 100 : "Off"
	;SetTimer, IgnorePain,				% (MetaBarbToggle) ? 150 : "Off"     ; Uncomment this line when you want to cast Ip by Macro
	SetTimer, WarCry,					% (MetaBarbToggle) ? 100 : "Off"
    Return
}

zBarb()
{
    MetaBarbToggle:=!MetaBarbToggle
    Send, +{%SprintHK%}
	SetTimer, ThreateningShout,			% (MetaBarbToggle) ? 100 : "Off"
	SetTimer, IgnorePain,				% (MetaBarbToggle) ? 150 : "Off"
	SetTimer, Sprint,					% (MetaBarbToggle) ? 3000 : "Off"
	SetTimer, WarCry,					% (MetaBarbToggle) ? 100 : "Off"    
    Return
}

zBarbBers()
{
    MetaBarbToggle:=!MetaBarbToggle
    Send, +{%SprintHK%}
	SetTimer, ThreateningShout,			% (MetaBarbToggle) ? 100 : "Off"
	SetTimer, IgnorePain,				% (MetaBarbToggle) ? 150 : "Off"
	SetTimer, Sprint,					% (MetaBarbToggle) ? 3000 : "Off"
	SetTimer, WarCry,					% (MetaBarbToggle) ? 100 : "Off"
    SetTimer, Berserk,					% (MetaBarbToggle) ? 100 : "Off"
    Return
}

ThreateningShout:
    send, +{%ShoutHK%}
return
IgnorePain:
    send, +{%IPHK%}
return
WarCry:
    send, +{%WarCryHK%}
Return
Sprint:
    send, +{%SprintHK%}
return
Berserk:
    send, +{%BerserkHK%}
return   


LonNec()
{
    NecToggle := !NecToggle
    If(!NecToggle)
    {
        SetTimer, Simulacrum, Off
        SetTimer, LandOfTheDeath, Off
    }
    If(!SecondSim)
    {
        Send, +{%LotDHK%}  
        Send, +{%SimulacrumHK%}
        SetTimer, Simulacrum,				% (NecToggle) ? 1000 : "Off"  
        SetTimer, LandOfTheDeath,			% (NecToggle) ? 1000 : "Off"
	}
    Else
    {
        Settimer, SecondSimTiming, % (NecToggle) ? 11000 : "off"
    }
    
	SetTimer, Devour,					% (NecToggle) ? 100 : "Off"
	SetTimer, BoneArmor,				% (NecToggle) ? 5000 : "Off"
  
    Return
}

zNec()
{
	NecToggle := !NecToggle
	SetTimer, CommandSkeletons,			% (NecToggle) ? 100 : "Off"
	SetTimer, LandOfTheDeath,			% (NecToggle) ? 500 : "Off"
	SetTimer, Devour,					% (NecToggle) ? 100 : "Off"  
    Return
}

SecondSimTiming:
    SetTimer, SecondSimTiming, Off
	SetTimer, Simulacrum,				% (NecToggle) ? 1000 : "Off" 
    SetTimer, LandOfTheDeath,			% (NecToggle) ? 1000 : "Off"
Return

LandOfTheDeath:
    send, +{%LotDHK%}
return
Devour:
    send, +{%DevourHK%}
return
BoneArmor:
    send, +{%BoneArmorHK%}
return
Simulacrum:
    send, +{%SimulacrumHK%}
return
CommandSkeletons:
    send, +{%CommSkellHK%}
return
    
ExitAppFunc:
{
    ExitApp
}




; ---------------- UPDATE NOTIFY -------------------
; Note: If you dont want to get a Notify on a newer Version go to the Top of the Script and Delete the Call of the Funktion (Line 24)



CheckNewVersion()
{
    UrlDownloadToFile, https://raw.githubusercontent.com/thedarklort/D3SoftHelper-AHK/master/README.md, CheckVers.txt
    If (ErrorLevel)
        Return
    SearchString := "Current Version:"
    Line := False
    Loop, Read, CheckVers.txt
    {
	If InStr(A_LoopReadLine, SearchString)
		If !Line
		{
			Line := A_LoopReadLine
			Continue ;second concerned line
		}
		Else
		{
			Line .= "`r`n" . A_LoopReadLine
			Break
		}
    }
    IfExist CheckVers.txt
        FileDelete CheckVers.txt

    FoundPos := InStr(Line,":")
    NewVersion := SubStr(Line,FoundPos + 2)
    If(NewVersion <> Version)
        MsgBox, 4,New Version Available, A new version is available, download now?
    Else
        Return
    IfMsgBox No
        Return
    run % "https://github.com/thedarklort/D3SoftHelper-AHK"    
    
}