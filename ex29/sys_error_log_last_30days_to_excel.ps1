$begin = (Get-Date).AddDays(-30);

$logs = Get-EventLog -LogName System -EntryType Error -After $begin;

$logs | Export-Excel -Path "eventlog.xlsx" -AutoSize

Write-Host "System errors logs have been exported to eventlog.xlsx." -ForegroundColor Green;