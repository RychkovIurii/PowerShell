$i = 1;
$colors = @("Red", "Green", "Yellow", "Blue", "Cyan", "Magenta", "White", "DarkRed", "DarkYellow", "Gray");

do {
	$color = $colors[($i % $colors.Count)];
	Write-Host $i -ForegroundColor $color;
	$i++;
} until ($i -eq 11);