# $dsc= ".\dsc\WindowsDefender"
#$dsc= ".\dsc\WindowsFirewall"
$dsc= ".\dsc\DotNetFramework"

$audit = Test-DscConfiguration -ReferenceConfiguration $dsc\localhost.mof
# View compliant settings
#$audit.ResourcesInDesiredState | Out-GridView
$audit.ResourcesInDesiredState | Tee-Object -FilePath $dsc\rids.txt

# View non-compliant settings
#$audit.ResourcesNotInDesiredState | Out-GridView
$audit.ResourcesNotInDesiredState | Tee-Object -FilePath $dsc\rnids.txt
