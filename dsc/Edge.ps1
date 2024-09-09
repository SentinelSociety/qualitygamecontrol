configuration Edge
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
        Edge EdgeSettings
        {
            # BrowserVersion = ''
            StigVersion = '1.8'
            # Exception   = @{
                # 'V-1075'= @{'ValueData'='1'}
            # }
            OrgSettings = @{
                'V-235719' = @{
                    ValueData = 'ProxyMode' # The proxy setting used by MS Edge
                }
            }
            # SkipRule = @(
            # )
        }
    }
}

Edge