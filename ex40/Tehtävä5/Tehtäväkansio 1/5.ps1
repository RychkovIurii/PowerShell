$namesFile = Get-ChildItem -Path "$pwd\names.txt" -ErrorAction SilentlyContinue;
if ($namesFile -eq $null) {
	Write-Host "File not found in the current directory. Please verify the file names.txt";
	exit;
}

#if we need we can create a group (New-LocalGroup -Name "Users" -Description "Standard user group")
$groupName = "Users";
if (-not (Get-LocalGroup -Name $groupName -ErrorAction SilentlyContinue)) {
	Write-Host "Group $groupName does not exist. Please verify the group name.";
	exit;
}

$users = Get-Content -Path $namesFile.FullName -Encoding UTF8;
foreach ($user in $users) {
	$user = $user -split " ";
	if ($user.Length -ne 3) {
		Write-Host "Invalid user format: $user" -ForegroundColor Red;
		continue;
	}
	$firstName = $user[0];
	$lastName = $user[1];
	$email = $user[2];
	$userName = $firstName.ToLower() + "." + $lastName.ToLower();
	$fullName = $firstName + " " + $lastName;

	if (Get-LocalUser -Name $userName -ErrorAction SilentlyContinue) {
		Write-Host "User $userName already exists. Skipping..." -ForegroundColor Red;
		continue;
	}

	$pwd_secure_string = ConvertTo-SecureString $email -AsPlainText -Force;

	New-LocalUser -Name $userName -FullName $fullname -Password $pwd_secure_string;
	Add-LocalGroupMember -Group "Users" -Member $userName;
	Write-Host "User $userName added to group 'Users'." -ForegroundColor Green;
}

#PS C:\Users\Admin\Desktop\Skriptaus_Vog\ex23> New-LocalGroup -Name "Users" -Description "Standard user group"
#PS C:\Users\Admin\Desktop\Skriptaus_Vog\ex23> Remove-LocalUser -Name "jackie.chan"
#PS C:\Users\Admin\Desktop\Skriptaus_Vog\ex23> Remove-LocalUser -Name "sauli.niinistö"
#PS C:\Users\Admin\Desktop\Skriptaus_Vog\ex23> Remove-LocalUser -Name "duke.nukem"
#PS C:\Users\Admin\Desktop\Skriptaus_Vog\ex23> Remove-LocalGroup -Name "Users"

<#The Microsoft.PowerShell.LocalAccounts module, which provides the Add-LocalGroupMember cmdlet,
is not supported in PowerShell 7 (Core). This module is specifically designed for Windows PowerShell (5.1)
and does not function in cross-platform versions like PowerShell 7 or later.#>
