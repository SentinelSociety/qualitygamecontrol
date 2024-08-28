$audit = Test-DscConfiguration -ReferenceConfiguration .\localhost.mof
# View compliant settings
$audit.ResourcesInDesiredState | Out-GridView

# View non-compliant settings
$audit.ResourcesNotInDesiredState | Out-GridView