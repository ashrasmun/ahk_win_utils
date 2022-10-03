# Before running this script, make sure you can do it :)
# Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser -Force
$ScriptPath = -Join($PSScriptRoot, "\\capslock_to_esc.exe")

If (-Not (Test-Path -Path $ScriptPath)) {
    Write-Host Expected $ScriptPath to be compiled.
    Exit
}

Start-Process $ScriptPath -Verb runAs
