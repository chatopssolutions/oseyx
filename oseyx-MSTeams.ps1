# Import all files required
$Path = ".\include"
Get-ChildItem -Path $Path -Filter *.ps1 | ForEach-Object {
    . $_.FullName
}

$WebhookURI = ''  #::MSTeams Webhook URL

# these values would be retrieved from or set by an application
$status = 'success'
$fact1 = 'All tests passed'
$fact2 = '1 test failed'

$body = ConvertTo-Json -Depth 4 @{
    title = 'New Build Notification'
    text = "A build completed with status $status"
    sections = @(
        @{
            activityTitle = 'Build'
            activitySubtitle = 'automated test platform'
            activityText = 'A change was evaluated and new results are available.'
            activityImage = 'https://' # this value would be a path to a nice image you would like to display in notifications
        },
        @{
            title = 'Details'
            facts = @(
                @{
                name = 'Unit Tests'
                value = $fact1
                },
                @{
                name = 'Integration Tests'
                value = $fact2
                }
            )
        }
    )
}


Invoke-WebRequest -URI $WebhookURI -Method Post -body $body -ContentType 'application/json' -UseBasicParsing -Proxy $ProxyURI -ProxyCredential $BotCredential

