$directoryPath = "$pwd\Tehtäväkansio 1"
if (-not (Test-Path $directoryPath)) {
	Write-Host "Directory $directoryPath does not exist."
	exit
}

$docxFiles = Get-ChildItem -Path $directoryPath -Filter *.docx -Recurse
if ($docxFiles.Count -eq 0) {
	Write-Host "No docx found in $directoryPath."
	exit
}

$pdfFolderPath = "$pwd\PDF";
if (-not (Test-Path -Path $pdfFolderPath)) {
	New-Item -Path $pdfFolderPath -ItemType Directory | Out-Null;
} else {
	Write-Host "Folder $pdfFolderPath already exists! Remove it and try again.";
	exit;
}

foreach ($docx in $docxFiles) {
	convert2pdf $docx.FullName | Move-Item -Destination $pdfFolderPath 2>$null;
}

Write-Host "All docx files converted to PDF and saved in $pdfFolderPath." -ForegroundColor Green;