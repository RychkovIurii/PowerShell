$christmasEve = Get-Date -Year 2024 -Month 12 -Day 24
$today = Get-Date

$daysTillChristmas = ($christmasEve - $today).Days
if ($daysTillChristmas -gt 0) {
	Write-Host "There are $daysTillChristmas days until Christmas." -ForegroundColor Green;
} elseif ($daysTillChristmas -eq 0) {
	Write-Host "Today is Christmas!!!Today is Christmas!!!Today is Christmas!!!Today is Christmas!!!" -ForegroundColor Blue;
} else {
	Write-Host "Christmas has already passed this year." -ForegroundColor Red;
}
Write-Host "Press any key to exit..."
[System.Console]::ReadKey($true) | Out-Null