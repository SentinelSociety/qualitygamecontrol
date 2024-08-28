$audit = Test-DscConfiguration -ReferenceConfiguration .\WindowsClient\localhost.mof
# View compliant settings
#$audit.ResourcesInDesiredState | Out-GridView
$audit.ResourcesInDesiredState | Tee-Object -FilePath .\WindowsClient\rids.txt

# View non-compliant settings
#$audit.ResourcesNotInDesiredState | Out-GridView
$audit.ResourcesNotInDesiredState | Tee-Object -FilePath .\WindowsClient\rnids.txt
