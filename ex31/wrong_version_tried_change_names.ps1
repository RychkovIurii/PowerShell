$source = "$pwd\Tehtäväkansio";
if (-not (Test-Path $source)) {
	Write-Host "Error: Source folder not found." -ForegroundColor Red;
	exit;
}

$tempFolder = Join-Path $pwd "tempfolder";
if (Test-Path $tempFolder) {
	Write-Host "Temporary folder already exists. Remove it and try again." -ForegroundColor Red;
	exit;
} else {
	New-Item -Path $tempFolder -ItemType Directory | Out-Null;
}

$destination = "$pwd\2.zip";

$alldocx = Get-ChildItem -Path $source -Recurse -Filter *.docx;
if ($alldocx.Count -eq 0) {
	Write-Host "Error: No .docx files found." -ForegroundColor Red;
	Remove-Item -Path $tempFolder -Force;
	exit;
}

# Resolve duplicate names
$seenNames = @{}
foreach ($file in $alldocx) {
	$baseName = $file.BaseName;
	$extension = $file.Extension;
	$newName = $file.Name;

	if ($seenNames.ContainsKey($newName)) {
		$seenNames[$newName]++;
		$newName = "{0}_{1}{2}" -f $baseName, $seenNames[$newName], $extension;
	} else {
		$seenNames[$newName] = 1;
	}

	# Copy to tempfolder in current directory
	$destinationPath = Join-Path -Path $tempFolder -ChildPath $newName
	Copy-Item -Path $file.FullName -Destination $destinationPath
}

try {
	Compress-Archive -Path "$tempFolder\*" -DestinationPath $destination;
	Write-Host "Archive created successfully." -ForegroundColor Green;
}
catch {
	Write-Host "Error: $_" -ForegroundColor Red;
}
finally {
	Remove-Item -Path $tempFolder -Force -Confirm:$false;
}