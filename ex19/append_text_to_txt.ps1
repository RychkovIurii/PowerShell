Get-ChildItem -Path $pwd/Tiedostot/ -Filter *.txt - -Recurse | ForEach-Object {
	Add-Content -Path $_.FullName -Value "123";
}