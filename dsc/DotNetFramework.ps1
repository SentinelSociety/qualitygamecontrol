configuration DotNetFramework
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
        DotNetFramework DotNetSettings
        {
            FrameworkVersion = '4'
            StigVersion = '2.4'
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
            # SkipRule = @(
            # )
        }
    }
}

DotNetFramework