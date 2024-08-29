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
        Edge BaseLine
        {
            # StigVersion = ''
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

Edge

# WARNING: MS_Edge_STIG: V-235719/RegistryRule/low contains an empty Organizational Value, setting rule as Skipped