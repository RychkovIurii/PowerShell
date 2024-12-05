$names1 = Get-Content -Path "Nimet1.txt"
$names2 = Get-Content -Path "Nimet2.txt"
$outfile = "missing_names.txt"

$diff = Compare-Object -ReferenceObject $names1 -DifferenceObject $names2;
$unique_names = $diff | Where-Object { $_.SideIndicator -eq "<=" }
$unique_names | ForEach-Object { $_.InputObject | Out-File -FilePath $pwd\$outfile -Append }
Write-Host "Missing names saved to $outfile";