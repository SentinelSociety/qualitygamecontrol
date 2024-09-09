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
                    ValueData = 'oiigbmnaadbkfbmpbfijlflahbdbdgdf' # a list of administrator-approved extension IDs
                }
                'V-221564' = @{
                    ValueData = 'Google Encrypted' # an organization approved encrypted search provider
                }# a list of administrator-approved extension IDs
                'V-221565' = @{
                    ValueData = 'https://www.google.com/search?q={searchTerms}' # an organization-approved encrypted search string
                }
            }
            # SkipRule = @(
            # )
        }
    }
}

Chrome