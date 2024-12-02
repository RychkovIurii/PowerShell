do {
	# Ask for device power (watts)
	do {
		$powerConsumption = Read-Host "Enter the power consumption in watts";
		if (-not ($powerConsumption -as [float])) {
			Write-Host "Error: Please enter a valid number!" -ForegroundColor Red;
			$validInputPower = $false;
		}
		elseif ([float]$powerConsumption -le 0) {
			Write-Host "Error: Power consumption cannot be negative!" -ForegroundColor Red;
			$validInputPower = $false;
		}
		else {
			$validInputPower = $true;
		}
	}
	while (-not $validInputPower)

	# Ask for usage time (hours per day)
	do {
		$usageTime = Read-Host "Enter the usage time in hours per day";
		if (-not ($usageTime -as [float])) {
			Write-Host "Error: Please enter a valid number!" -ForegroundColor Red;
			$validInputTime = $false;
		}
		elseif ([float]$usageTime -le 0) {
			Write-Host "Error: Usage time cannot be negative!" -ForegroundColor Red;
			$validInputTime = $false;
		}
		else {
			$validInputTime = $true;
		}
	}
	while (-not $validInputTime)

	# Ask for price per kilowatt-hour (cents)
	do {
		$pricePerKWh = Read-Host "Enter the price per kilowatt-hour in cents";
		if (-not ($pricePerKWh -as [float])) {
			Write-Host "Error: Please enter a valid number!" -ForegroundColor Red;
			$validInputPrice = $false;
		}
		elseif ([float]$pricePerKWh -le 0) {
			Write-Host "Error: Price per kilowatt-hour cannot be negative!" -ForegroundColor Red;
			$validInputPrice = $false;
		}
		else {
			$validInputPrice = $true;
		}
	}
	while (-not $validInputPrice)

	$powerConsumption = [float]$powerConsumption;
	$usageTime = [float]$usageTime;
	$pricePerKWh = [float]$pricePerKWh;

	# Calculate energy consumption (kWh)
	$energyConsumption = $powerConsumption * $usageTime / 1000;

	# Calculate energy cost (cents)
	$energyCost = $energyConsumption * $pricePerKWh / 100;

	# Calculate annual cost (cents)
	$annualCost = $energyCost * 365;

	Write-Host "The energy consumption is $energyConsumption kWh." -ForegroundColor Green;
	Write-Host "The energy cost is $energyCost cents per day." -ForegroundColor Green;
	Write-Host "The annual cost is $annualCost cents." -ForegroundColor Green;
	
	#[System.Console]::ReadKey($true) | Out-Null;
	$exit = Read-Host "Do you want to calculate the cost for another device? Press (y) to continue or any other key to exit";
	}
while ($exit -eq "y")
Write-Host "Thank you for using the energy cost calculator. Goodbye!" -ForegroundColor Blue;
