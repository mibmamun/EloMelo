$ErrorActionPreference = "SilentlyContinue"

$AppName = "*Zoom (32-bit)*"
$AppVersion = "5.17.31859" 


$Apps = (Get-ChildItem HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\) | Get-ItemProperty | select DisplayName, DisplayVersion
$Apps += (Get-ChildItem HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\) | Get-ItemProperty | select DisplayName, DisplayVersion


$AppFound = $Apps | Where-Object {
($_.DisplayName -like $AppName) -and ([version]$_.DisplayVersion -ge [version]$AppVersion)
}

if ($AppFound) 
{Write-Output "Installed"}