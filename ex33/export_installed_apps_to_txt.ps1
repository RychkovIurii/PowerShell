$path = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall";

$outfile = "1.txt";
if(Test-Path $outfile) {
	Write-Host "The file $outfile already exists. Remove it and run the script again." -ForegroundColor Red;
	exit;
}

$installedApps = Get-ChildItem -Path $path -Recurse | Get-ItemProperty;

$installedApps | Out-File -FilePath $outfile;

Write-Host "The list of installed applications has been saved to $outfile" -ForegroundColor Green;