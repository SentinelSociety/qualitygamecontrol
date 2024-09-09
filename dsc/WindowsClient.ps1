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
            StigVersion = '1.6'
            # DomainName = 'your.domain'
            # ForestName = 'your.domain'
            # Exception   = @{
                # 'V-1075'= @{'ValueData'='1'}
            # }
            OrgSettings = @{
                'V-253261' = @{
                    ValueData = '6' # BitLocker PIN minimum length
                }
                'V-253369.a' = @{
                    ValueData = '2' # Require Secure Boot
                }
                'V-253369.b' = @{
                    ValueData = '2' # Require Virtualization Based Security
                }
                # Use the InstallRoot tool from https://cyber.mil/pki-pke/tools-configuration-files to install these files
                # 'V-253427.a' = @{
                #     Location = 'cert:LocalMachine\Root' # DOD Root CA 3 (Certificate Pfx file)
                # }
                # 'V-253427.b' = @{
                #     Location = 'cert:LocalMachine\Root' # DOD Root CA 4 (Certificate Pfx file)
                # }
                # 'V-253427.c' = @{
                #     Location = 'cert:LocalMachine\Root' # DOD Root CA 5 (Certificate Pfx file)
                # }
                # 'V-253427.d' = @{
                #     Location = 'cert:LocalMachine\Root' # DOD Root CA 6 (Certificate Pfx file)
                # }
                # 'V-253429.a' = @{
                #     Location = 'cert:LocalMachine\disallowed' # DOD Interoperability Root CA 2 (Certificate Pfx file)
                # }
                # 'V-253429.b' = @{
                #     Location = 'cert:LocalMachine\disallowed' # DOD Interoperability Root CA 2 (Certificate Pfx file)
                # }
                # 'V-253430.a' = @{
                #     Location = 'cert:LocalMachine\disallowed' # DOD CCEB Interoperability Root CA 2 (Certificate Pfx file)
                # }
                # 'V-253430.b' = @{
                #     Location = 'cert:LocalMachine\disallowed' # DOD CCEB Interoperability Root CA 2 (Certificate Pfx file)
                # }
                # TODO Rename account appropiately
                'V-253435' = @{
                    OptionValue = 'sra' # Built-in admin account name
                }
                # TODO Rename account appropiately
                'V-253436' = @{
                    OptionValue = 'operator' # Built-in guest account name
                }
            }
            SkipRule = @(
                # Custom
                # 'V-253260.a',  # BitLocker PIN for pre-boot auth
                # 'V-253260.b',  # BitLocker PIN for pre-boot auth
                # 'V-253369.a',  # Virtualation-based security
                # 'V-253369.b',  # Virtualation-based security
                # 'V-253370',  # Virtualation-based security
                # 'V-253371',  # Virtualation-based security
                'V-253377' # Auth using certificates
                # 'V-253380', # Enhanced anti-spoofing (for facial recognition)
                # 'V-253416', # Disable Basic auth for WinRM
                # 'V-253417', # Disallow unencrypted traffic for WinRM
                # 'V-253418', # Disable Basic auth for WinRM
                # 'V-253419' # Disallow unencrypted traffic for WinRM
            )
        }
    }
}

WindowsClient

# TODO
# WARNING: Microsoft_Windows_11_STIG: V-253377/RegistryRule/medium will be Skipped as specified by the configuration
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