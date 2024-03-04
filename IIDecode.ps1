# REDDs InvisInk Decoder
# Ver: 1.0.1
param($Inp,$Out,$Str)
$zws,$zwn=[char]0x200B,[char]0x200C
function Dec {$args-replace$zws,'0'-replace$zwn,'1'-split'(?<=\G.{8})'|?{$_-match'^[01]{8}$'}|%{[convert]::ToByte($_,2)}}
$Output=if($Str){[Text.Encoding]::UTF8.GetString((Dec $Str))}elseif($Inp){[Text.Encoding]::UTF8.GetString((Dec(gc(Join-Path (gl)$Inp)-raw)))}
if($Out){$Output|Out-File -FilePath (Join-Path (gl)$Out)}else{$Output}
