<# true/false SfB installed on system #>
[bool]$SfBInstalled = 0
<# SfB x86/x64 installed on system #>
[int]$SfBVersion = 0

<# test $SfB x64 installed on system #>
if((Test-Path -Path ("C:\Program Files\Microsoft Office\root\Office16\lync.exe") -IsValid) -eq $true){
    $SfBInstalled = 1
    $SfbVersion = 64
}
<# test $SfB x86 installed on system #>
if((Test-Path -Path ("C:\Program Files (x86)\Microsoft Office\root\Office16\lync.exe") -IsValid) -eq $true){
    $SfBInstalled = 1
    $SfBVersion = 86
}

else{
    $SfbInstalled = 0
}
