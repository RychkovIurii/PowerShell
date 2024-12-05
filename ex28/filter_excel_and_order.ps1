$inputFile = "$pwd\50_people.xlsx";
$outputFile = "$pwd\50_Names.xlsx";

$data = Import-Excel -Path $inputFile

$filteredData = $data | Select-Object -Property "First Name", "Last Name" | Sort-Object -Property "Last Name";

$filteredData | Export-Excel -Path $outputFile -AutoSize;

Write-Host "Filtered and sorted data saved to $outputFile" -ForegroundColor Green;
