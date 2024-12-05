#The Compress-Archive cmdlet ignores hidden files and folders when creating or updating the archive file. On non-Windows machines, this includes files and folders with name that begins with the period (.) character.
#To ensure hidden files and folders are compressed into the archive, use the .NET API instead.

$source = "$pwd\Tehtäväkansio";
if (-not (Test-Path $source)) {
	Write-Host "Error: Source folder not found." -ForegroundColor Red;
	exit;
}

$destination = "$pwd\1.zip";

try {
	Compress-Archive -Path $source -DestinationPath $destination;
	Write-Host "Archive created successfully." -ForegroundColor Green;
}
catch {
	Write-Host "Error: $_" -ForegroundColor Red;
}
