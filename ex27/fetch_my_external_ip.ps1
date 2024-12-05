$url = "https://api.myip.com";

$response = Invoke-WebRequest -Uri $url;

$content = $response | ConvertFrom-Json;

$ip = $content.ip;

Write-Host "Your external IP address is: $($ip)" -ForegroundColor Green;

