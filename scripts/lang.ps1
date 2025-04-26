$langs =
"fr-FR",
"ja-JP",
"ko-KR",
"zh-CN",
"zh-TW"
foreach ($i in $langs) { Install-Language -Language $i -CopyToSettings }
Set-SystemPreferredUILanguage ja-JP
