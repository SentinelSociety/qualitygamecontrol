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
            OsVersion   = '11'
            Exception   = @{
                #'V-1075'= @{'ValueData'='1'}
            }
            OrgSettings = @{
                # 'V-205909' = @{
                #     OptionValue = 'xAdmin'
                # }
                # 'V-205910' = @{
                #     OptionValue = 'Disabled_Guest'
                # }
            }
            #SkipRule = @('V-1075','V-1076')
        }
    }
}

WindowsClient