$folderName = Read-Host "Minkä niminen kansio luodaan?";
New-Item -ItemType Directory -Name $folderName;