Get-ChildItem | Where-Object { $_.Extension -ne ".ps1" } | ForEach-Object {
	$ext = $_.Extension;
	if (-not (Test-Path $ext)) {
		New-Item -ItemType Directory -Name $ext;
	}
	Move-Item $_ $ext;
}

# We can trim dot from the extension by using the Substring method $_.Extension.Substring(1)