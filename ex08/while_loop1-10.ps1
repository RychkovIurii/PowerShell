$i = 1;
$colors = @("Red", "Green", "Yellow", "Blue", "Cyan", "Magenta", "White", "DarkRed", "DarkYellow", "Gray");

while($i -le 10) {
	$color = $colors[($i % $colors.Count)];
	Write-Host $i -ForegroundColor $color;
	$i++;
}