$services = Get-Service;
foreach ($service in $services) {
	if ($service.Status -eq "Running") {
		Write-Host "$($service.DisplayName)";
	}
}
Write-Host "Press any key to exit" -ForegroundColor Green;
[System.Console]::ReadKey($true) | Out-Null;