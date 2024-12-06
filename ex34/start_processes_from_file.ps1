$filePath = "$pwd\Linkit1.txt"
if (-not (Test-Path -Path $filePath)) {
	Write-Host "File $filePath does not exist." -ForegroundColor Red;
	exit;
}

$links = Get-Content -Path $filePath

foreach ($link in $links) {
	Start-Process -FilePath $link
}

Write-Host "All links from $filePath have been opened in the default browser." -ForegroundColor Green;
