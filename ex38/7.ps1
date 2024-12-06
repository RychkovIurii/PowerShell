do {
	$dayNumber = Read-Host "Anna viikonpäivän numero";
	if ([string]::IsNullOrWhiteSpace($dayNumber)) {
		Write-Host "Viikonpäivän numero on virheellinen!" -ForegroundColor Red;
		$validInput = $false;
		continue
	}
	try {
		$dayNumber = [int]$dayNumber;
		$validInput = $true
	}
	catch {
		Write-Host "Viikonpäivän numero on virheellinen!" -ForegroundColor Red;
		$validInput = $false;
		continue
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
	default { $dayName = "Viikonpäivän numero on virheellinen!" }
}
if ($dayName -ne "Viikonpäivän numero on virheellinen!") {
	Write-Host "Viikonpäivän nimi on $dayName" -ForegroundColor Green;
} else {
	Write-Host $dayName -ForegroundColor Red;
}
Write-Host "Press any key to exit..."
[System.Console]::ReadKey($true) | Out-Null