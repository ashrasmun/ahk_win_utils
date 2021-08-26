; Use the line below is you just need to remove the title bar
; WinSet, Style, -0xC00000, A
; WinSet, Style, ^0xC00000, A

WS_CAPTION    = 0xC00000
WS_THICKFRAME = 0x40000
WS_HSCROLL    = 0x100000
WS_VSCROLL    = 0x200000

+F5::
    Reload
    Return

+F4::
    WinGetPos,,, Width, Height, A
    WinMove, A,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
    Return

+F3::
    WinGet, IsMinimal, Style, A
    WinGetPos, x, y, Width, Height, A

    if (IsMinimal & WS_CAPTION)
    {
        WinSet, Style, -%WS_CAPTION%, A
        WinSet, Style, -%WS_THICKFRAME%, A
        WinSet, Style, -%WS_VSCROLL%, A
        WinMove, A,, x+8, y+1, Width-16, Height-9
    }
    else
    {
        WinSet, Style, +%WS_CAPTION%, A
        WinSet, Style, +%WS_THICKFRAME%, A
        WinSet, Style, +%WS_VSCROLL%, A
        WinMove, A,, x-8, y-1, Width+16, Height+9
    }

    Return
