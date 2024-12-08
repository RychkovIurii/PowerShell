<#
using module Send-MailKitMessage;

#use secure connection if available ([bool], optional)
$UseSecureConnectionIfAvailable = $true;

#authentication ([System.Management.Automation.PSCredential], optional)
$Credential = [System.Management.Automation.PSCredential]::new("Username", (ConvertTo-SecureString -String "Password" -AsPlainText -Force));

#SMTP server ([string], required)
$SMTPServer = "SMTPServer";

#port ([int], required)
$Port = PortNumber;

#sender ([MimeKit.MailboxAddress] http://www.mimekit.net/docs/html/T_MimeKit_MailboxAddress.htm, required)
$From = [MimeKit.MailboxAddress]"SenderEmailAddress";

#recipient list ([MimeKit.InternetAddressList] http://www.mimekit.net/docs/html/T_MimeKit_InternetAddressList.htm, required)
$RecipientList = [MimeKit.InternetAddressList]::new();
$RecipientList.Add([MimeKit.InternetAddress]"Recipient1EmailAddress");

#cc list ([MimeKit.InternetAddressList] http://www.mimekit.net/docs/html/T_MimeKit_InternetAddressList.htm, optional)
$CCList = [MimeKit.InternetAddressList]::new();
$CCList.Add([MimeKit.InternetAddress]"CCRecipient1EmailAddress");

#bcc list ([MimeKit.InternetAddressList] http://www.mimekit.net/docs/html/T_MimeKit_InternetAddressList.htm, optional)
$BCCList = [MimeKit.InternetAddressList]::new();
$BCCList.Add([MimeKit.InternetAddress]"BCCRecipient1EmailAddress");

#subject ([string], optional)
$Subject = [string]"Subject";

#text body ([string], optional)
$TextBody = [string]"TextBody";

#HTML body ([string], optional)
$HTMLBody = [string]"HTMLBody";

#attachment list ([System.Collections.Generic.List[string]], optional)
$AttachmentList = [System.Collections.Generic.List[string]]::new();
$AttachmentList.Add("Attachment1FilePath");

#splat parameters
$Parameters = @{
    "UseSecureConnectionIfAvailable" = $UseSecureConnectionIfAvailable    
    "Credential" = $Credential
    "SMTPServer" = $SMTPServer
    "Port" = $Port
    "From" = $From
    "RecipientList" = $RecipientList
    "CCList" = $CCList
    "BCCList" = $BCCList
    "Subject" = $Subject
    "TextBody" = $TextBody
    "HTMLBody" = $HTMLBody
    "AttachmentList" = $AttachmentList
};

#send message
Send-MailKitMessage @Parameters;
#>

using module Send-MailKitMessage;

$UseSecureConnectionIfAvailable = $true;
$SMTPServer = "smtp.gmail.com";
$Port = 587;
$From = [MimeKit.MailboxAddress]"frommail@gmail.com";
$RecipientList = [MimeKit.InternetAddressList]::new();
$RecipientList.Add([MimeKit.InternetAddress]"to whomname@opp.eduvantaa.fi");
$Subject = [string]"Test email";
$TextBody = [string]"Hi dude! This is a test email.";

$Credential = [System.Management.Automation.PSCredential]::new("frommail@gmail.com", (ConvertTo-SecureString -String "frompassword" -AsPlainText -Force));

$Parameters = @{
    "UseSecureConnectionIfAvailable" = $UseSecureConnectionIfAvailable
    "Credential" = $Credential
    "SMTPServer" = $SMTPServer
    "Port" = $Port
    "From" = $From
    "RecipientList" = $RecipientList
    "Subject" = $Subject
    "TextBody" = $TextBody
};

Send-MailKitMessage @Parameters;

Write-Host "Email sent successfully." -ForegroundColor Green;