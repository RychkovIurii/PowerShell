do {
	$amountNumbers = Read-Host "Enter the amount of numbers you want to get average of";
	try {
		if ($amountNumbers -eq [int]$amountNumbers){$amountNumbers = [int]$amountNumbers}
		else {
			Write-Host "Invalid input, please enter a number (positive integer)"
			continue;
		}
		if ($amountNumbers -lt 1) {
			Write-Host "Invalid input, please enter a number (positive integer)";
			continue;
		}
		Write-Host "Amount of numbers: $amountNumbers";
		break;
	} catch {
		Write-Host "Invalid input, please enter a number (positive integer)";
	}
} while ($true);
$sum = 0;
for ($i = 0; $i -lt $amountNumbers; $i++) {
	do {
		$number = Read-Host "Enter number $($i + 1)";
		try {
			$number = [int]$number;
			break;
		} catch {
			Write-Host "Invalid input, please enter a number (integer)";
		}
	} while ($true);
	$sum += $number;
}

$average = $sum / $amountNumbers;
Write-Host "Average: $average";
Write-Host "Press any key to exit";
[System.Console]::ReadKey($true) | Out-Null;