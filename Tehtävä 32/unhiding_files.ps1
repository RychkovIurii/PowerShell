#To make hidden files visible, the following registry key must be set to 1
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name Hidden -Value 1

$path = "$pwd\Tehtäväkansio";
if (-not (Test-Path $path)) {
	Write-Host "Error: Source folder not found." -ForegroundColor Red;
	exit;
}

# Set Force to include hidden files
$items = Get-ChildItem -Path $path -Recurse -Force;

foreach ($item in $items) {
	try {
		# If item is a file, set Hidden attribute
		if ($item.PSIsContainer -eq $false) {
			$currentAttributes = $item.Attributes
			if ($currentAttributes -band [System.IO.FileAttributes]::Hidden) {
				$item.Attributes = $currentAttributes -band -bnot [System.IO.FileAttributes]::Hidden
				Write-Host "Unhidden File: $($item.FullName)" -ForegroundColor Green
			}
		}
		# If item is a directory, handle separately
		elseif ($item.PSIsContainer -eq $true) {
			$currentAttributes = $item.Attributes
			if ($currentAttributes -band [System.IO.FileAttributes]::Hidden) {
				$item.Attributes = $currentAttributes -band -bnot [System.IO.FileAttributes]::Hidden
				Write-Host "Unhidden Directory: $($item.FullName)" -ForegroundColor Green
			}
		}
	}
	catch {
		Write-Host "Error: $($item.FullName)" -ForegroundColor Red;
	}
}
