# not 100% accurate, but good enough for most cases

while ($true) {
	Write-Host (Get-Date -Format "dd-MM-yyyy HH:mm:ss") -ForegroundColor Green;
	Start-Sleep -Seconds 1;
	Clear-Host;
}
