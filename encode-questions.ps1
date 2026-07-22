# تشفير ملفات الأسئلة إلى Base64
$src = "D:\ملفاتي\samir-teoria-website\assets\questions"
$dst = "D:\ملفاتي\samir-teoria-website\build\web\assets\assets\questions"

Get-ChildItem -LiteralPath $src -Filter "*.txt" | ForEach-Object {
    $content = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes($_.FullName))
    $outFile = Join-Path $dst ($_.BaseName + ".b64")
    Set-Content -LiteralPath $outFile -Value $content -NoNewline -Encoding ASCII
    Write-Host ("Encoded: " + $_.Name + " -> " + (Split-Path $outFile -Leaf))
}
Write-Host "Done!"
