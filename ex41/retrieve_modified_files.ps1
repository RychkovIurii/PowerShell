$userProfile = Get-ChildItem Env:USERPROFILE | Select-Object -ExpandProperty Value;

$htmlFile = "latest.html";
<#if (Test-Path $htmlFile) {
	Write-Host "The file $htmlFile already exists. Please remove it and run the script again." -ForegroundColor Red;
	exit;
}#>

#I'm not sure do We consider folders as files or not, so I'm noy using -File parameter to get only files. If we need only files, we can add -File parameter to Get-ChildItem
$files = Get-ChildItem -Path $userProfile -Recurse | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-3) } | Select-Object Name, LastAccessTime, LastWriteTime, FullName;

$sortedFiles = $files | Sort-Object LastAccessTime -Descending;

$htmlContent = $sortedFiles | ConvertTo-Html;

$htmlContent | Out-File -FilePath $htmlFile;

Write-Host "HTML report created at $htmlFile" -ForegroundColor Green;