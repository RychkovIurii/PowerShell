$url = "https://api.chucknorris.io/jokes/random";

$response = Invoke-WebRequest -Uri $url;

$content = $response | ConvertFrom-Json;

$joke = $content.value;

write-host $joke;