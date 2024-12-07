$folder = "$pwd\Tehtäväkansio";
if (-not (Test-Path $folder)) {
	Write-Host "Folder $folder does not exist" -ForegroundColor Red;
	exit;
}

$limit = 1048576;

Get-ChildItem -Path $folder -File -Recurse | Where-Object { $_.Length -lt $limit } | Remove-Item -Recurse -Force;
Write-Host "Files smaller than 1MB deleted" -ForegroundColor Green;