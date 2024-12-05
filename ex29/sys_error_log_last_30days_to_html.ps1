$begin = (Get-Date).AddDays(-30);

$logs = Get-EventLog -LogName System -EntryType Error -After $begin;

$logs | ConvertTo-Html | Out-File "eventlog.html";

Write-Host "System errors logs have been exported to eventlog.html." -ForegroundColor Green;