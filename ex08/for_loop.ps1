$colors = @("Red", "Green", "Yellow", "Blue", "Cyan", "Magenta", "White", "DarkRed", "DarkYellow", "Gray");

for ($i = 10; $i -ge 1; $i--) {
	$color = $colors[($i % $colors.Count)];
	Write-Host $i -ForegroundColor $color;
}