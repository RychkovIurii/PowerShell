$years = 2010..2015;
$months = 1..12;
$days = 1..31;

foreach ($year in $years) {
	New-Item -ItemType Directory -Path $pwd/$year;
	foreach ($month in $months) {
		New-Item -ItemType Directory -Path $pwd/$year/$month;
		foreach ($day in $days) {
			New-Item -ItemType Directory -Path $pwd/$year/$month/$day;
		}
	}
}
Write-Host "Execution completed";