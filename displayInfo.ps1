# script.ps1 - Educational BadUSB Demo Script

Write-Host "----------------------------"
Write-Host "   PowerShell BadUSB Demo   "
Write-Host "----------------------------"
Write-Host "Date/Time: $(Get-Date)"
Write-Host "User: $env:USERNAME"
Write-Host "Computer: $env:COMPUTERNAME"
Write-Host ""

try {
    $publicIP = (Invoke-RestMethod -Uri "https://api.ipify.org?format=text" -TimeoutSec 5)
    $geo = Invoke-RestMethod -Uri "http://ip-api.com/json/$publicIP" -TimeoutSec 5
    if ($geo.status -eq "success") {
        Write-Host "------------------------"
        Write-Host "IP-based Location Info:"
        Write-Host "------------------------"
        Write-Host "Public IP    : $publicIP"
        Write-Host "Country      : $($geo.country)"
        Write-Host "Region       : $($geo.regionName)"
        Write-Host "City         : $($geo.city)"
        Write-Host "ZIP          : $($geo.zip)"
        Write-Host "ISP          : $($geo.isp)"
        Write-Host "Lat/Lon      : $($geo.lat), $($geo.lon)"
        Write-Host ""

        $osmUrl = "https://www.openstreetmap.org/?mlat=$($geo.lat)&mlon=$($geo.lon)#map=12/$($geo.lat)/$($geo.lon)"
        Write-Host "Opening OpenStreetMap at IP-based location ($($geo.lat), $($geo.lon))..."
        Start-Process $osmUrl
    } else {
        Write-Host "Could not determine location from ip-api.com."
    }
}
catch {
    Write-Host "Could not retrieve IP-based location."
}

Write-Host ""
Write-Host "This code was executed on your machine via a USB device using a single line in PowerShell."
Write-Host ""
Write-Host "******************************"
Write-Host "*  SECURITY WARNING:         *"
Write-Host "*  Never trust unknown USB   *"
Write-Host "*  devices!                  *"
Write-Host "******************************"
Write-Host ""
Read-Host -Prompt "Press Enter to exit"
