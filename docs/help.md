**Examples:**  
- Display all available commands:  
  ```powershell
  Get-Command
  ```
- Find information about a specific command (e.g., Get-Help)
  ```powershell
  Get-Command -Name "Get-Help"
  ```
- Show basic information about a command:
  ```powershell
  Get-Help Get-Command
  ```
- Show detailed information about a command:
  ```powershell
  Get-Help Get-Command -Detailed
  ```
 To see the examples, type: "get-help Get-Help -examples".
    For more information, type: "get-help Get-Help -detailed".
    For technical information, type: "get-help Get-Help -full".
    For online help, type: "get-help Get-Help -online"