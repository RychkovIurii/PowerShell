
# Explanation

1. **Set-ExecutionPolicy Unrestricted**  
   This command allows all PowerShell scripts to run on your system, including those downloaded from the internet.  
   ⚠️ **Warning**: It can expose your system to potential security risks. Use this setting only if necessary, and revert to a safer execution policy afterward.

2. **New-ItemProperty**  
   This command modifies the Windows registry to make file extensions visible in File Explorer by setting the `HideFileExt` registry key to `0`.

3. **Write-Output "Hello"**  
   Outputs the text "Hello" to the console.

4. **New-Item -ItemType Directory -Name Newfolder**  
   Creates a new folder named Newfolder in the current directory.

---

# Commands

```powershell
# This command allows all scripts to run on your system, including those downloaded from the internet. 
# Be cautious of the security implications.
Set-ExecutionPolicy Unrestricted
# Reset the execution policy to a safer level after completing the task.
Set-ExecutionPolicy Restricted

# Modify the registry to make file extensions visible in File Explorer.
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0 -PropertyType DWORD -Force

# Output a message
Write-Output "Hello"

# Create a new directory named 'Newfolder'
New-Item -ItemType Directory -Name Newfolder
