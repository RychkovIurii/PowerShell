$path = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall";
$outfile = "2.html";

if (Test-Path $outfile) {
	Write-Host "The file $outfile already exists. Please remove it and run the script again." -ForegroundColor Red;
	exit;
}

$installedApps = Get-ChildItem -Path $path -Recurse | Get-ItemProperty | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate;

$htmlContent = $installedApps | ConvertTo-Html -Property DisplayName, DisplayVersion, Publisher, InstallDate;

$htmlContent | Out-File -FilePath "2.html"

Write-Host "The list of installed applications has been saved to $outfile" -ForegroundColor Green;