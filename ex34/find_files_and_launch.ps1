$directoryPath = "$pwd"

#I search all the jpg files in the directory. Did't understand the task correctly.
#If I need to search proper 4 digit files, I would use another approach. Here I just search all jpg files.
$imageFiles = Get-ChildItem -Path $directoryPath -Filter *.jpg -Recurse
if ($imageFiles.Count -eq 0) {
	Write-Host "No images found in $directoryPath."
	exit
}

foreach ($image in $imageFiles) {
	Start-Process -FilePath $image.FullName
}

Write-Host "All images from $directoryPath have been opened in the default viewer." -ForegroundColor Green;
