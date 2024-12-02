# Get the computer name
$hostname = $env:COMPUTERNAME

# Get the list of running processes
$processes = Get-Process

# Output file path
$outputFile = "HostProcess.txt"

# Write the hostname and processes to the file
"$hostname" | Out-File -FilePath $outputFile -Encoding utf8
$processes | Out-File -FilePath $outputFile -Append -Encoding utf8