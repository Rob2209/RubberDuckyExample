# script.ps1 - Educational BadUSB Demo Script

Write-Host "----------------------------"
Write-Host "  PowerShell BadUSB Demo    "
Write-Host "----------------------------"
Write-Host "User: $env:USERNAME"
Write-Host "Computer: $env:COMPUTERNAME"
Write-Host "Domain: $env:USERDOMAIN"
Write-Host "IP Address(es):"
Get-NetIPAddress | Where-Object {$_.AddressFamily -eq 'IPv4'} | Format-Table -AutoSize
Write-Host ""
Write-Host "This code was executed on your machine via a USB device using a single line in PowerShell."
Write-Host "This demonstrates how a BadUSB attack could run scripts directly from the web on your computer!"
Write-Host "ALWAYS be cautious about what you plug into your PC!"
Write-Host ""
Read-Host -Prompt "Press Enter to exit"
