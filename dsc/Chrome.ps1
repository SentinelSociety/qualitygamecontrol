configuration Chrome
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
        Chrome ChromeSettings
        {
            # BrowserVersion = ''
            StigVersion = '2.9'
            # Exception   = @{
                # 'V-1075'= @{'ValueData'='1'}
            # }
            OrgSettings = @{
                'V-221563' = @{
                    OptionValue = '' # a list of administrator-approved extension IDs
                },
                'V-221564' = @{
                    OptionValue = 'Google Encrypted' # an organization approved encrypted search provider
                },
                'V-221565' = @{
                    OptionValue = 'https://www.google.com/search?q={searchTerms}' # an organization-approved encrypted search string
                }
            }
            # SkipRule = @(
            # )
        }
    }
}

Chrome

# WARNING: Google_Chrome_Current_Windows: V-221563/RegistryRule/medium contains an empty Organizational Value, setting
# rule as Skipped
# WARNING: Google_Chrome_Current_Windows: V-221564/RegistryRule/medium contains an empty Organizational Value, setting
# rule as Skipped
# WARNING: Google_Chrome_Current_Windows: V-221565/RegistryRule/medium contains an empty Organizational Value, setting
# rule as Skipped