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

Chrome

# WARNING: Google_Chrome_Current_Windows: V-221563/RegistryRule/medium contains an empty Organizational Value, setting
# rule as Skipped
# WARNING: Google_Chrome_Current_Windows: V-221564/RegistryRule/medium contains an empty Organizational Value, setting
# rule as Skipped
# WARNING: Google_Chrome_Current_Windows: V-221565/RegistryRule/medium contains an empty Organizational Value, setting
# rule as Skipped