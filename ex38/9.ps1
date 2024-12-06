do {
	$consumption = Read-Host "Enter your car's average fuel consumption in liters per 100 km";
	if (-not ($consumption -as [double])) {
		Write-Host "Error: Please enter a valid number!" -ForegroundColor Red;
		$validInput = $false;
	}
	elseif ([double]$consumption -le 0) {
		Write-Host "Error: Consumption cannot be negative or zero!" -ForegroundColor Red;
		$validInput = $false;
	}
	else {
		$validInput = $true;
	}
}
while (-not $validInput)
do {
	$distance = Read-Host "Enter the distance in kilometers";
	if (-not ($distance -as [double])) {
		Write-Host "Error: Please enter a valid number!" -ForegroundColor Red;
		$validInputDistance  = $false;
	}
	elseif ([double]$distance -le 0) {
		Write-Host "Error: Distance cannot be negative or zero!" -ForegroundColor Red;
		$validInputDistance  = $false;
	}
	else {
		$validInputDistance  = $true;
	}
}
while (-not $validInputDistance )
$consumption = [double]$consumption;
$distance = [double]$distance;
$result = $consumption * $distance / 100;
Write-Host "The fuel consumption for the $distance km distance is $result liters." -ForegroundColor Green;
Write-Host "Press Enter to exit";
Read-Host | Out-Null;