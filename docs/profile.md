# Check the profile path
```powershell
Write-Output $profile
```

# Create the profile if it doesn't exist
```powershell
New-Item -ItemType File -Path $profile -Force
```

# Open the profile in Notepad
```powershell
notepad $profile
```

**`Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete`**  
   - Changes the behavior of the `Tab` key in the PowerShell console.
   - By default, `Tab` performs a simple auto-complete (cycling through available options).
   - The `MenuComplete` function displays a navigable menu of all possible completions when pressing `Tab`.
   ```notepad
	Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
	```