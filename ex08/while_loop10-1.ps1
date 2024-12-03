$i = 10;
$colors = @("Red", "Green", "Yellow", "Blue", "Cyan", "Magenta", "White", "DarkRed", "DarkYellow", "Gray");

while($i -gt 0) {
	$color = $colors[($i % $colors.Count)];
	Write-Host $i -ForegroundColor $color;
	$i--;
}