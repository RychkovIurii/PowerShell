Get-Process -Name Notepad -ErrorAction SilentlyContinue | Out-Null;
if ($?) {
	Write-Host "Notepad process is running!" -ForegroundColor Green;
} else {
	Write-Host "Notepad process is not running!" -ForegroundColor Red;
}
Write-Host "Press any key to exit..."
[System.Console]::ReadKey($true) | Out-Null
