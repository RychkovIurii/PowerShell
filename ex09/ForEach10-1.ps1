$numbers = 10..1;
$colors = @("Red", "Green", "Yellow", "Blue", "Cyan", "Magenta", "White", "DarkRed", "DarkYellow", "Gray");

foreach ($number in $numbers) {
	$color = $colors[($number % $colors.Count)];
	Write-Host $number -ForegroundColor $color;
}