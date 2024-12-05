$excelFile = "$pwd\50_people.xlsx";
$htmlFile = "$pwd\50_people.html";

# Import the Excel data
$data = Import-Excel -Path $excelFile;

# Convert the data to an HTML table
$htmlContent = $data | ConvertTo-Html;

# Save the HTML content to a file
$htmlContent | Out-File -FilePath $htmlFile;

Write-Host "Excel file has been converted to HTML: $htmlFile" -ForegroundColor Green;
