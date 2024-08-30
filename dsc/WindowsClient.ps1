configuration WindowsClient
{
    param
    (
        [parameter()]
        [string]
        $NodeName = 'localhost'
    )

    Import-DscResource -ModuleName PowerStig

    Node $NodeName
    {
        WindowsClient BaseLine
        {
            OsVersion = '11'
            # DomainName = 'your.domain'
            # ForestName = 'your.domain'
            # Exception   = @{
                # 'V-1075'= @{'ValueData'='1'}
            # }
            # OrgSettings = @{
                # 'V-205909' = @{
                #     OptionValue = 'xAdmin'
                # }
                # 'V-205910' = @{
                #     OptionValue = 'Disabled_Guest'
                # }
            # }
            SkipRule = @(
                'V-253260.a',  # BitLocker PIN for pre-boot auth
                'V-253260.b',  # BitLocker PIN for pre-boot auth
                'V-253369.a',  # Virtualation-based security
                'V-253369.b',  # Virtualation-based security
                'V-253370',  # Virtualation-based security
                'V-253371',  # Virtualation-based security
                'V-253377', # Auth using certificates
                'V-253380', # Enhanced anti-spoofing (for facial recognition)
                'V-253416', # Disable Basic auth for WinRM
                'V-253417', # Disallow unencrypted traffic for WinRM
                'V-253418', # Disable Basic auth for WinRM
                'V-253419' # Disallow unencrypted traffic for WinRM
            )
            SkipRule = $SkipRule + $ExternalSkipRules
        }
    }
}

WindowsClient

# WARNING: Microsoft_Windows_11_STIG: V-253260.a/RegistryRule/high will be Skipped as specified by the configuration
# WARNING: Microsoft_Windows_11_STIG: V-253260.b/RegistryRule/high will be Skipped as specified by the configuration
# WARNING: Microsoft_Windows_11_STIG: V-253261/RegistryRule/medium contains an empty Organizational Value, setting rule
# as Skipped
# WARNING: Microsoft_Windows_11_STIG: V-253369.a/RegistryRule/medium will be Skipped as specified by the configuration
# WARNING: Microsoft_Windows_11_STIG: V-253369.b/RegistryRule/medium will be Skipped as specified by the configuration
# WARNING: Microsoft_Windows_11_STIG: V-253370/RegistryRule/high will be Skipped as specified by the configuration
# WARNING: Microsoft_Windows_11_STIG: V-253371/RegistryRule/medium will be Skipped as specified by the configuration
# WARNING: Microsoft_Windows_11_STIG: V-253377/RegistryRule/medium will be Skipped as specified by the configuration
# WARNING: Microsoft_Windows_11_STIG: V-253380/RegistryRule/medium will be Skipped as specified by the configuration
# WARNING: Microsoft_Windows_11_STIG: V-253416/RegistryRule/high will be Skipped as specified by the configuration
# WARNING: Microsoft_Windows_11_STIG: V-253417/RegistryRule/medium will be Skipped as specified by the configuration
# WARNING: Microsoft_Windows_11_STIG: V-253418/RegistryRule/high will be Skipped as specified by the configuration
# WARNING: Microsoft_Windows_11_STIG: V-253419/RegistryRule/medium will be Skipped as specified by the configuration
# WARNING: Microsoft_Windows_11_STIG: V-253427.a/RootCertificateRule/medium contains an empty Organizational Value,
# setting rule as Skipped
# WARNING: Microsoft_Windows_11_STIG: V-253427.b/RootCertificateRule/medium contains an empty Organizational Value,
# setting rule as Skipped
# WARNING: Microsoft_Windows_11_STIG: V-253427.c/RootCertificateRule/medium contains an empty Organizational Value,
# setting rule as Skipped
# WARNING: Microsoft_Windows_11_STIG: V-253427.d/RootCertificateRule/medium contains an empty Organizational Value,
# setting rule as Skipped
# WARNING: Microsoft_Windows_11_STIG: V-253429.a/RootCertificateRule/medium contains an empty Organizational Value,
# setting rule as Skipped
# WARNING: Microsoft_Windows_11_STIG: V-253429.b/RootCertificateRule/medium contains an empty Organizational Value,
# setting rule as Skipped
# WARNING: Microsoft_Windows_11_STIG: V-253430.a/RootCertificateRule/medium contains an empty Organizational Value,
# setting rule as Skipped
# WARNING: Microsoft_Windows_11_STIG: V-253430.b/RootCertificateRule/medium contains an empty Organizational Value,
# setting rule as Skipped
# WARNING: Microsoft_Windows_11_STIG: V-253435/SecurityOptionRule/medium contains an empty Organizational Value, setting
# rule as Skipped
# WARNING: Microsoft_Windows_11_STIG: V-253436/SecurityOptionRule/medium contains an empty Organizational Value, setting
# rule as Skipped