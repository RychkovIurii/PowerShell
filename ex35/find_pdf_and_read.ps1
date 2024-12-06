<#
1.Searches for all .pdf files in the target folder and its subdirectories.
2.Reads the first three words from each PDF file to simulate reading the title.
3.Renames the PDF files based on these words.
4.Creates a new folder named PDF.
5.Moves the renamed files into the newly created PDF folder.
#>

$folderPath = "$pwd/Tehtäväkansio";
if (-not (Test-Path -Path $folderPath)) {
	Write-Host "Folder $folderPath not found!";
	exit;
}

$pdfFolderPath = "$pwd/PDF";
if (-not (Test-Path -Path $pdfFolderPath)) {
	New-Item -Path $pdfFolderPath -ItemType Directory | Out-Null;
} else {
	Write-Host "Folder $pdfFolderPath already exists! Remove it and try again.";
	exit;
}

$pdfFiles = Get-ChildItem -Path $folderPath -Recurse -Filter *.pdf;

foreach ($pdfFile in $pdfFiles) {
	$pdfContent = Import-PDFFile -Path $pdfFile.FullName;
	$pdfContent = $pdfContent -split " ";
	if ($pdfContent.Length -lt 3) {
		Write-Host "File $pdfFile empty! We skip it" -ForegroundColor Yellow;
		continue;
	} else {
		$pdfTitle = $pdfContent[0] + " " + $pdfContent[1] + " " + $pdfContent[2];
		$pdfNewName = $pdfTitle + ".pdf";
		Move-Item -Path $pdfFile.FullName -Destination $pdfFolderPath\$pdfNewName;
		Write-Host "File $pdfFile renamed and moved.";
	}
}

Write-Host "Finished!" -ForegroundColor Green;
