$names1 = Import-Excel -Path "Nimet1.xlsx";
$names2 = Import-Excel -Path "Nimet2.xlsx";
$outfile = "kaikki_nimet.xlsx";

#we use -Property * to sort by all properties, without it it returns one row
$unique_names = $names1 + $names2 | Sort-Object -Property * -Unique;

$unique_names | Export-Excel -Path $outfile -AutoSize;

Write-Host "Unique names saved to $outfile" -ForegroundColor Green;