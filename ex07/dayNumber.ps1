do {
	$min = 1;
	$max = 7;
	$dayNumber = Read-Host "Enter the day number (1-7)";
	if (-not ($dayNumber -as [int])) {
		Write-Host "Error: Please enter a valid number!" -ForegroundColor Red
		$validInput = $false
	} elseif ([int]$dayNumber -lt $min -or [int]$dayNumber -gt $max) {
		Write-Host "Error: Please enter a number between $min and $max!" -ForegroundColor Red
		$validInput = $false
	}
	else {
		$validInput = $true
	}
} while (-not $validInput)
$dayNumber = [int]$dayNumber;
switch ($dayNumber) {
	1 { $dayName = "maanantai" }
	2 { $dayName = "tiistai" }
	3 { $dayName = "keskiviikko" }
	4 { $dayName = "torstai" }
	5 { $dayName = "perjantai" }
	6 { $dayName = "lauantai" }
	7 { $dayName = "sunnuntai" }
	default { $dayName = "Error: Unknown day number" }
}
if ($dayName -ne "Error: Unknown day number") {
	Write-Host "The day number $dayNumber is $dayName" -ForegroundColor Green;
} else {
	Write-Host $dayName -ForegroundColor Red;
}
Write-Host "Press any key to exit..."
[System.Console]::ReadKey($true) | Out-Null