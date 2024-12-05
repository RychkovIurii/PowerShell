$begin = (Get-Date).AddDays(-30);

Get-EventLog -LogName System -EntryType Error -After $begin;