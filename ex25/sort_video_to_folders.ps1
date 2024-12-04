$videoFiles = Get-ChildItem -Path $pwd -Filter *.mp4 -Recurse
foreach ($file in $videoFiles) {
	$fileName = $file.BaseName;
	if ($fileName.Length -ge 8) {
		$year = $fileName.Substring(0, 4);
		$month = $fileName.Substring(4, 2);
		$day = $fileName.Substring(6, 2);


		$monthName = (Get-Culture).DateTimeFormat.GetMonthName([int]$month);
		$weekday = (Get-Date "$year-$month-$day").DayOfWeek;
		$folderPath = Join-Path -Path $pwd -ChildPath "$year\$month - $monthName\$day.$weekday";
		if (-not (Test-Path -Path $folderPath)) {
			New-Item -Path $folderPath -ItemType Directory -Force;
		}

		$destinationPath = Join-Path -Path $folderPath -ChildPath $file.Name;
		Move-Item -Path $file.FullName -Destination $destinationPath -Force;
		Write-Host "Moved $($file.Name) to $folderPath" -ForegroundColor Green;
	}
	else {
		Write-Host "Skipping $($file.Name): Filename format does not match YYYYMMDD.mp4 or YYYYMMDDsomething.mp4" -ForegroundColor Red;
	}
}