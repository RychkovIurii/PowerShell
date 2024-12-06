$directoryPath = "$pwd";
$infilePath = "$directoryPath\Linkit2.txt";
if (-not (Test-Path $infilePath)) {
	Write-Host "No infile $infilePath found." -ForegroundColor Red;
	exit;
}

# Usage Select-String -Path "$PSHOME\en-US\*.txt" -Pattern '\?'

# Regex for http and https till first whitespace or EOF
$regEx = 'http://[^\s]+|https://[^\s]+';

$links = Select-String -Path $infilePath -Pattern $regEx | ForEach-Object { $_.Matches.Value };
if ($links.Count -eq 0) {
	Write-Host "No links found in $infilePath." -ForegroundColor Red;
	exit;
}

foreach ($link in $links) {
	Write-Host "Opening link $link";
	Start-Process -FilePath $link;
}

Write-Host "All links from $infilePath have been opened in the default browser." -ForegroundColor Green;