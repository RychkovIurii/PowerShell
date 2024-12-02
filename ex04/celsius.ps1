$limitCelsius = 100;

do {
	$celsius = (Read-Host "Type the temperature in Celsius and press Enter");
	if (-not ($celsius -as [int])) {
		Write-Host "Error: Please enter a valid integer!" -ForegroundColor Red;
		$validInput = $false;
	}
	elseif ([math]::Abs([int]$celsius) -gt $limitCelsius) {
		Write-Host "Error: Absolute value of temperature cannot exceed 100C!" -ForegroundColor Red;
		$validInput = $false;
	}
	else {
		$validInput = $true;
	}
} while (-not $validInput)
$celsius = [int]$celsius;
$fahrenheit = ($celsius * 9/5) + 32;
Write-Host "The $celsius Celsius is equal to $fahrenheit Fahrenheit.";
[System.Console]::ReadKey($true) | Out-Null;