$name = $null;
do {
	$name = Read-Host "Enter the new user's login name (username)";
	if (Get-LocalUser -Name $name -ErrorAction SilentlyContinue) {
		Write-Host "Username '$name' not available." -ForegroundColor Red;
		$name = $null;
	}
} while (-not $name)


$fullname = $null;
do {
	$fullname = Read-Host "Enter the new user's full name (first and last name)";
	if (-not $fullname) {
		Write-Host "Error: Full name cannot be empty." -ForegroundColor Red;
	}
} while (-not $fullname)


$description = Read-Host "Enter the new user's description"

#$pwd_secure_string.Length -eq 0: This checks if the length of the SecureString is zero.
#!Huom (-not $pwd_secure_string) does not work here, because $pwd_secure_string is not null, it is a SecureString object.

$pwd_secure_string = $null;
do {
	$pwd_secure_string = Read-Host "Enter the new user's password" -AsSecureString;
	if ($pwd_secure_string.Length -eq 0) {
		Write-Host "Error: Password cannot be empty." -ForegroundColor Red;
	}
} while ($pwd_secure_string.Length -eq 0)

New-LocalUser -Name $name -FullName $fullname -Description $description -Password $pwd_secure_string

if (Get-LocalGroup -Name "Users" -ErrorAction SilentlyContinue) {
	Add-LocalGroupMember -Group "Users" -Member $name
	if ($?) {
		Write-Host "User '$name' added to group 'Users'." -ForegroundColor Green
	} else {
		Write-Host "Error adding user '$name' to group 'Users'." -ForegroundColor Red
	}
} else {
	Write-Host "Warning: Group 'Users' does not exist. User was not added to any group." -ForegroundColor Yellow
}

Get-LocalUser -Name $name | Select-Object Name, FullName, Description

#New-LocalGroup -Name "Users" -Description "Standard user group"
#Remove-LocalGroup -Name "Users"
#Remove-LocalGroup Users