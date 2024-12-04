$validInput = $false;
do {
	$startYear = Read-Host "Enter start year (yyyy)";
	if ($startYear -match "^\d{4}$") {
		$startYear = [int]$startYear;
	}
	else {
		Write-Host "Invalid input. Please enter a valid year.";
		continue;
	}
	$endYear = Read-Host "Enter end year (yyyy)";
	if ($endYear -match "^\d{4}$") {
		$endYear = [int]$endYear;
		if ($endYear -ge $startYear) {
			$validInput = $true;
		}
		else {
			Write-Host "End year must be greater than or equal to start year.";
		}
	}
	else {
		Write-Host "Invalid input. Please enter a valid year.";
		continue;
	}
} while (-not $validInput);

$years = $startYear..$endYear;
$months = 1..12;

foreach ($year in $years) {
	New-Item -ItemType Directory -Path $pwd\$year;
	foreach ($month in $months) {
		$monthName = (Get-Culture).DateTimeFormat.GetMonthName($month);
		New-Item -ItemType Directory -Path "$pwd\$year\$month - $monthName";
		$days = 1..[datetime]::DaysInMonth($year, $month);
		foreach ($day in $days) {
			$weekday = (Get-Date "$year-$month-$day").DayOfWeek;
			New-Item -ItemType Directory -Path "$pwd\$year\$month - $monthName\$day.$weekday";
		}
	}
}
Write-Host "Folders created successfully!" -ForegroundColor Green;