#To make hidden files visible, the following registry key must be set to 1
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name Hidden -Value 1

$path = "$pwd";

$items = Get-ChildItem -Path $path -Recurse -Exclude "skripti1.ps1", "skripti2.ps1"

# Set 'Hidden' attribute for each item
foreach ($item in $items) {
	try {
		$currentAttributes = $item.Attributes
		if (-not ($currentAttributes -band [System.IO.FileAttributes]::Hidden)) {
			$item.Attributes = $currentAttributes -bor [System.IO.FileAttributes]::Hidden
			Write-Host "Hidden: $($item.FullName)" -ForegroundColor Green
		}
	}
	catch {
		Write-Host "Error: $($item.FullName)" -ForegroundColor Red;
	}
}
