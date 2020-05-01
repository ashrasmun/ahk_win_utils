#SingleInstance force
SetStoreCapsLockMode Off

; Dollar sign is required here, as it makes sure that sending one hotkey
; doesn't trigger the other one.

$CapsLock::Esc
$Esc::
Send, {CapsLock}

if GetKeyState("CapsLock", "T") = 1
{
    Gui, RIGHT:Default
    Gui, Margin, 0, 0
    Gui +LastFound
    Gui, Color, FFFFF0
    WinSet, TransColor, FFFFF0
    Gui, -Caption +AlwaysOnTop
    Gui, Add, Picture, w1000 h-1 x0 y0 vPicR, %A_WorkingDir%\images\CapsLockON.png
    ; 960 - half of width
    Gui, Show, x460 y800 NoActivate

    Gui, LEFT:Default
    Gui, Margin, 0, 0
    Gui +LastFound
    Gui, Color, FFFFF0
    WinSet, TransColor, FFFFF0
    Gui, -Caption +AlwaysOnTop
    Gui, Add, Picture, w1000 h-1 xCenter yCenter vPicL, %A_WorkingDir%\images\CapsLockON.png
    ; -960 - half of width
    Gui, Show, x-1460 y800 NoActivate
}
else if GetKeyState("CapsLock", "T") = 0
{
    Gui, LEFT:Destroy
    Gui, RIGHT:Destroy
}
return

