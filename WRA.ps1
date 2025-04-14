# PowerShell script to silently download and replace rarreg.key in WinRAR directory

# Define URL for the .key file
$downloadUrl = "https://raw.githubusercontent.com/ofclsuleman/Winrar-Activator/main/rarreg.key"
$destinationPath = "C:\Program Files\WinRAR\rarreg.key"

# Check if script is running as administrator
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Script needs to run as Administrator. Please run the script as administrator." -ForegroundColor Red
    exit
}

# Suppress errors and output
$ErrorActionPreference = 'SilentlyContinue'

# Check if the file exists, and if so, delete it
if (Test-Path $destinationPath) {
    Remove-Item $destinationPath -Force
}

# Download the .key file
try {
    (New-Object System.Net.WebClient).DownloadFile($downloadUrl, $destinationPath)
    Write-Host "File downloaded and replaced successfully!" -ForegroundColor Green
} catch {
    Write-Host "Failed to download the file." -ForegroundColor Red
}
