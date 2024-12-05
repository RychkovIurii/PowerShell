#Import-Module ImportExcel ** import module
#Get-Command -Module ImportExcel ** check available commands
#Get-Help Import-Excel ** check help
#Get-Help Import-Excel (-Full or -Examples) ** check full help or examples

$outputFile = "$pwd\1.xlsx";

$processes = Get-Process;

# Export the data to Excel
$processes | Export-Excel -Path $outputFile -AutoSize;

Write-Host "Processes exported to $outputFile" -ForegroundColor Green;
