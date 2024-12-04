Get-NetIPAddress |
Select-Object -Property IPAddress, InterfaceAlias, AddressFamily |
ConvertTo-Html | Out-File -FilePath "$pwd\ip.html";

Start-Process "$pwd\ip.html";