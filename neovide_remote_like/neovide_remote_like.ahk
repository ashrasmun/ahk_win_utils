; Use this script as a way to access files in Total Commander or other source
; if you would like to use only one instance of NeoVim at a time.

#SingleInstance on

if A_Args.Length() != 1
{
    MsgBox % "This script requires a filename as argument"
    ExitApp
}

WinGet, Windows, List
found := false

Loop, %Windows%
{
    this_id := "ahk_id " . Windows%A_Index%
    WinGetTitle, this_title, %this_id%

    if RegExMatch(this_title, "Neovim")
    {
        found := true
    }
}

if found
{
    WinActivate, Neovim

    ; Make the sending fast as heck boi
    SetKeyDelay -1
    SetBatchLines -1

    Send, {Escape}      ; Go to "normal" mode
    Send, :e %1%{Enter} ; Edit the specified file
    Send, :{Escape}     ; Hide the command from the bottom command line
}
else
{
    Run nvim-qt "%1%"
}
