$newFolder = Read-Host -Prompt 'Minkä niminen kansio luodaan?'
New-Item -Path $pwd -Name $newFolder -ItemType Directory