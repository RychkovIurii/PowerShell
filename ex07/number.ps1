do {
	$value = 10;
	$number = Read-Host "Enter a number";
	if (-not ($number -as [long])) {
		Write-Host "Error: Please enter a valid number (int) or (long)" -ForegroundColor Red;
		$validInput = $false;
	} else {
		$validInput = $true;
	}
} while (-not $validInput)
$number = [long]$number;
if ($number -eq $value) {
	Write-Host "The number is exactly $value" -ForegroundColor Green;
} elseif ($number -gt $value) {
	Write-Host "The number is greater than $value" -ForegroundColor Blue;
} else {
	Write-Host "The number is less than $value" -ForegroundColor Red;
}
Write-Host "Press any key to exit..."
[System.Console]::ReadKey($true) | Out-Null