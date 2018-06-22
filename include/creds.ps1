<#
Store password for auto-credential cachine
#>

$User = ''  #::DOMAIN\UserID
$PassWord = ConvertTo-SecureString -String "" -AsPlainText -Force  #::Domain account password

$BotCredential = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $User, $PassWord
