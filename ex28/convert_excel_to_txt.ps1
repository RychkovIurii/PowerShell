$inputFile = "$pwd\50_people.xlsx";
$outputFile = "$pwd\Names.txt";

$data = Import-Excel -Path $inputFile;

$filteredData = $data | Select-Object -Property "First Name", "Last Name";

foreach ($row in $filteredData) {
	$row."First Name" + " " + $row."Last Name" | Out-File -FilePath $outputFile -Append;
}

Write-Host "Data saved to $outputFile" -ForegroundColor Green;