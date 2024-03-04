# REDDs InvisInk Encoder
# Ver: 1.0.1
param($Inp,$Out,$Str)
$zws,$zwn=[char]0x200B,[char]0x200C
function Enc { $args|%{$_|%{[Convert]::ToString($_,2).PadLeft(8,'0')-replace 0,$zws-replace 1,$zwn}} }
$Output=if($Str){@(Enc ([System.Text.Encoding]::UTF8.GetBytes($Str)))}elseif($Inp){@(Enc ([System.IO.File]::ReadAllBytes((Join-Path (Get-Location) $Inp))))}
if($Out){Out-File -FilePath (Join-Path (Get-Location) $Out) -InputObject ($Output -join '')}else{$Output -join ''}
