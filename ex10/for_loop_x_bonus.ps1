$x = "";
$i = 0;
$increasing = $true;
while ($true) {
	$x = "x" * $i;
	Write-Host $x;
	Start-Sleep -Milliseconds 20;
	if ($increasing) {
		$i++;
		if ($i -ge 30) {
			$increasing = $false;
		}
	} else {
		$i--;
		if ($i -le 1) {
			$increasing = $true;
		}
	}
}