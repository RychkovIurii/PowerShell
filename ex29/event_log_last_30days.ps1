$begin = (Get-Date).AddDays(-30);

Get-EventLog -LogName System -After $begin;