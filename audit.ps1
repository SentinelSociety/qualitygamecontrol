function Test-DscConfigurationForPath {
    param (
        [string]$dscPath
    )

    # Check if the path is valid
    if (-not (Test-Path $dscPath)) {
        Write-Error "The path '$dscPath' does not exist."
        return
    }

    # Test DSC configuration
    $audit = Test-DscConfiguration -ReferenceConfiguration "$dscPath\localhost.mof"

    # Output compliant settings to a file
    $compliantFile = "$dscPath\rids.txt"
    $audit.ResourcesInDesiredState | Tee-Object -FilePath $compliantFile
    # $audit.ResourcesInDesiredState | Out-GridView

    # Output non-compliant settings to a file
    $nonCompliantFile = "$dscPath\rnids.txt"
    $audit.ResourcesNotInDesiredState | Tee-Object -FilePath $nonCompliantFile
    # $audit.ResourcesNotInDesiredState | Out-GridView
}

# List of DSC paths to process
$dscPaths = @(
    ".\dsc\Chrome",
    ".\dsc\DotNetFramework",
    ".\dsc\Edge",
    ".\dsc\Firefox",
    ".\dsc\WindowsClient",
    ".\dsc\WindowsDefender",
    ".\dsc\WindowsFirewall"
)

# Run the function for each path
foreach ($dscPath in $dscPaths) {
    Test-DscConfigurationForPath -dscPath $dscPath
}
