$imageFiles = Get-ChildItem -Path $pwd -Filter *.jpg -Recurse
foreach ($file in $imageFiles) {
	$exifData = Get-ExifDateTaken -Path $file.FullName;
	$captureYear = $exifData.ExifDateTaken.Year;
	$captureMonth = $exifData.ExifDateTaken.Month;
	$monthName = (Get-Culture).DateTimeFormat.GetMonthName($captureMonth);
	$captureDay = $exifData.ExifDateTaken.Day;
	$weekday = $exifData.ExifDateTaken.DayOfWeek;

	$captureHour = $exifData.ExifDateTaken.Hour;
	$captureMinute = $exifData.ExifDateTaken.Minute;

	if ($captureYear -ne $null -and $captureMonth -ne $null -and $captureDay -ne $null) {
		$folderPath = Join-Path -Path $pwd -ChildPath "$captureYear\$captureMonth - $monthName\$captureDay.$weekday";
		if (-not (Test-Path -Path $folderPath)) {
			New-Item -Path $folderPath -ItemType Directory -Force;
		}

		$baseFileName = "$captureYear-$captureMonth-$captureDay" + "_" + "{0:D2}.{1:D2}" -f $captureHour, $captureMinute;
		$destinationPath = Join-Path -Path $folderPath -ChildPath "$baseFileName.jpg";

		$counter = 2;
		while (Test-Path -Path $destinationPath) {
			$newBaseFileName = "$baseFileName" + "_$counter.jpg";
			$destinationPath = Join-Path -Path $folderPath -ChildPath $newBaseFileName;
			$counter++;
		}

		Move-Item -Path $file.FullName -Destination $destinationPath;
	}
}