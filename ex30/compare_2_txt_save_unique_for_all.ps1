$names1 = Get-Content -Path "Nimet1.txt";
$names2 = Get-Content -Path "Nimet2.txt";
$outfile = "kaikki_nimet.txt";

$unique_names = $names1 + $names2 | Sort-Object -Unique;
$unique_names | Out-File -FilePath $pwd\$outfile;

Write-Host "Unique names saved to $outfile" -ForegroundColor Green;