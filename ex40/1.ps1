$base = "Viikko ";

for ($i = 1; $i -le 52; $i++) {
	$folderName = $base + $i;
	New-Item -ItemType Directory -Path $folderName;
}
Write-Host "Script executed";