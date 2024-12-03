#$imageFiles = Get-ChildItem -Path $pwd -Recurse | Where-Object { $_.Extension -eq ".jpg" }

$imageFiles = Get-ChildItem -Path $pwd -Filter *.jpg -Recurse
foreach ($file in $imageFiles) {
	$exifData = Get-ExifDateTaken -Path $file.FullName;
	$captureYear = $exifData.ExifDateTaken.Year;
	$captureMonth = $exifData.ExifDateTaken.Month;
	$monthName = (Get-Culture).DateTimeFormat.GetMonthName($captureMonth);
	$captureDay = $exifData.ExifDateTaken.Day;
	$weekday = $exifData.ExifDateTaken.DayOfWeek;
	if ($captureYear -ne $null -and $captureMonth -ne $null -and $captureDay -ne $null) {
		$folderPath = Join-Path -Path $pwd -ChildPath "$captureYear\$captureMonth - $monthName\$captureDay.$weekday";
		if (-not (Test-Path -Path $folderPath)) {
			New-Item -Path $folderPath -ItemType Directory -Force;
		}
		Move-Item -Path $file.FullName -Destination $folderPath;
	}
}