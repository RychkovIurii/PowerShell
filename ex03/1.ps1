# Create the main folder
New-Item -Path "$env:USERPROFILE\Desktop" -Name Exercise03_Rychkov -ItemType Directory -Force


# Create Processit.ps1
@"
Get-Process | Set-Content -Path "$env:USERPROFILE\Desktop\Exercise03_Rychkov\prosessit.txt"
"@ | Set-Content -Path "$env:USERPROFILE\Desktop\Exercise03_Rychkov\Processit.ps1"

# Create LuoKansio.ps1
@'
$newFolder = Read-Host -Prompt 'Minkä niminen kansio luodaan?'
New-Item -Path $pwd -Name $newFolder -ItemType Directory -Force
'@ | Set-Content -Path "$env:USERPROFILE\Desktop\Exercise03_Rychkov\LuoKansio.ps1"