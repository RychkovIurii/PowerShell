do {
	$value = 10.0;
	$number = Read-Host "Enter a number";
	if ([string]::IsNullOrWhiteSpace($number)) {
		Write-Host "Error: Please enter a valid number (int or float)" -ForegroundColor Red;
		$validInput = $false;
		continue;
	}

	try {
		$number = [double]$number;
		$validInput = $true;
	} catch {
		Write-Host "Error: Please enter a valid number (int or float)" -ForegroundColor Red;
		$validInput = $false;
		continue;
	}
} while (-not $validInput)
if ($number -eq $value) {
	Write-Host "The number is exactly $value" -ForegroundColor Green;
} elseif ($number -gt $value) {
	Write-Host "The number is greater than $value" -ForegroundColor Blue;
} else {
	Write-Host "The number is less than $value" -ForegroundColor Red;
}
Write-Host "Press any key to exit..."
[System.Console]::ReadKey($true) | Out-Null