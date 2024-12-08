using module Send-MailKitMessage;

function screenshot($path)
{
    [void] [Reflection.Assembly]::LoadWithPartialName("System.Drawing")
    [void] [Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    $left = [Int32]::MaxValue
    $top = [Int32]::MaxValue
    $right = [Int32]::MinValue
    $bottom = [Int32]::MinValue

    foreach ($screen in [Windows.Forms.Screen]::AllScreens)
    {
        if ($screen.Bounds.X -lt $left)
        {
            $left = $screen.Bounds.X;
        }
        if ($screen.Bounds.Y -lt $top)
        {
            $top = $screen.Bounds.Y;
        }
        if ($screen.Bounds.X + $screen.Bounds.Width -gt $right)
        {
            $right = $screen.Bounds.X + $screen.Bounds.Width;
        }
        if ($screen.Bounds.Y + $screen.Bounds.Height -gt $bottom)
        {
            $bottom = $screen.Bounds.Y + $screen.Bounds.Height;
        }
    }

    $bounds = [Drawing.Rectangle]::FromLTRB($left, $top, $right, $bottom);
    $bmp = New-Object Drawing.Bitmap $bounds.Width, $bounds.Height;
    $graphics = [Drawing.Graphics]::FromImage($bmp);

    $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size);

    $bmp.Save($path);

    $graphics.Dispose();
    $bmp.Dispose();
}

screenshot "$pwd\screenshot.png";

$attachment = "$pwd\screenshot.png";
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
$Subject = [string]"Screenshot";
$TextBody = [string]"Hi dude! This is a screenshot.";
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
Remove-Item "$pwd\screenshot.png";
Write-Host "Screenshot removed." -ForegroundColor Green;