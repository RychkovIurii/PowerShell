$city = Read-Host "Enter city name for weather data";

$url = "https://wttr.in/";

$response = Invoke-WebRequest -Uri "$url$city";

$content = $response.Content -split "\n";

for ($i = 0; $i -lt $content.Length - 2; $i++) {
	Write-Host $content[$i]
}