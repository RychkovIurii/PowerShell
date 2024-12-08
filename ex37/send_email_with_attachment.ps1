using module Send-MailKitMessage;

$folder = "$pwd\Tehtäväkansio";
if (-not (Test-Path $folder)) {
	Write-Host "Cannot find the folder '$folder'." -ForegroundColor Red;
	exit;
}

$attachment = "$folder\testitiedosto.txt";
if (-not (Test-Path $attachment)) {
	Write-Host "Cannot find the attachment '$attachment'." -ForegroundColor Red;
	exit;
}

$UseSecureConnectionIfAvailable = $true;
$SMTPServer = "smtp.gmail.com";
$Port = 587;
$From = [MimeKit.MailboxAddress]"from@gmail.com";
$RecipientList = [MimeKit.InternetAddressList]::new();
$RecipientList.Add([MimeKit.InternetAddress]"to@opp.eduvantaa.fi");
$Subject = [string]"Test email";
$TextBody = [string]"Hi dude! This is a test email.";
$AttachmentList = [System.Collections.Generic.List[string]]::new();
$AttachmentList.Add("$attachment");

$Credential = [System.Management.Automation.PSCredential]::new("from@gmail.com", (ConvertTo-SecureString -String "frompass" -AsPlainText -Force));

$Parameters = @{
    "UseSecureConnectionIfAvailable" = $UseSecureConnectionIfAvailable
    "Credential" = $Credential
    "SMTPServer" = $SMTPServer
    "Port" = $Port
    "From" = $From
    "RecipientList" = $RecipientList
    "Subject" = $Subject
    "TextBody" = $TextBody
	"AttachmentList" = $AttachmentList
};

Send-MailKitMessage @Parameters;

Write-Host "Email sent successfully." -ForegroundColor Green;