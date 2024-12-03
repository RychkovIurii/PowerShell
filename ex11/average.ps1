do {
	$numberOfValues = Read-Host "Enter the number of values";
	if (-not ($numberOfValues -as [int])) {
		Write-Host "Error: Please enter a positive integer!" -ForegroundColor Red;
		$validInputAmount = $false;
	}
	elseif ([int]$numberOfValues -lt 1) {
		Write-Host "Error: Please enter a positive integer!" -ForegroundColor Red;
		$validInputAmount = $false;
	}
	else {
		$validInputAmount = $true;
	}
}
while (-not $validInputAmount)
$numberOfValues = [int]$numberOfValues;

$sum = 0;
$validInputNumber = $true;
for ($i = 1; $i -le $numberOfValues; $i++) {
	do {
		$value = Read-Host "Enter the value $i";
		$valueInt = $value -as [int];
		if ($null -eq $valueInt) {
			Write-Host "Error: Please enter a valid integer!" -ForegroundColor Red;
			$validInputNumber = $false;
		}
		else {
			$validInputNumber = $true;
			$sum += $valueInt;
		}
	}
	while (-not $validInputNumber)
}

$average = $sum / $numberOfValues;
Write-Host "The average is $average";
Write-Host "Press any key to exit";
[System.Console]::ReadKey($true) | Out-Null;
