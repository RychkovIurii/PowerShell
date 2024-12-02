
do {
	$kilometers = Read-Host -Prompt "Type the distance in kilometers and press Enter";
	if (-not ($kilometers -as [double])) {
		Write-Host "Error: Please enter a valid number!" -ForegroundColor Red;
		$validInput = $false;
	}
	elseif ([double]$kilometers -le 0) {
		Write-Host "Error: Distance cannot be negative!" -ForegroundColor Red;
		$validInput = $false;
	}
	else {
		$validInput = $true;
	}
}
while (-not $validInput)
$miles = $kilometers / 1.6093445;
Write-Host "The $kilometers kilometers is equal to $miles miles.";
[System.Console]::ReadKey($true) | Out-Null;