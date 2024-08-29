$audit = Test-DscConfiguration -ReferenceConfiguration .\dsc\WindowsClient\localhost.mof
# View compliant settings
#$audit.ResourcesInDesiredState | Out-GridView
$audit.ResourcesInDesiredState | Tee-Object -FilePath .\dsc\WindowsClient\rids.txt

# View non-compliant settings
#$audit.ResourcesNotInDesiredState | Out-GridView
$audit.ResourcesNotInDesiredState | Tee-Object -FilePath .\dsc\WindowsClient\rnids.txt
