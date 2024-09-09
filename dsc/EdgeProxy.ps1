configuration EdgeProxy
{
    param
    (
        [string] $NodeName = 'localhost',
        [string] $ProxyMode = 'direct' # Options: 'direct', 'system', 'auto_detect', 'fixed_servers', 'pac_script'
        # [string] $ProxyServer = '' # Specify if ProxyMode is 'fixed_servers'
    )

    Import-DscResource -ModuleName PsDesiredStateConfiguration

    Node $NodeName
    {
        # Define registry path for Edge settings
        $edgeRegistryPath = 'HKCU:\Software\Policies\Microsoft\Edge\ProxySettings'

        # Create the registry path if it does not exist
        Registry $edgeRegistryPath
        {
            Ensure = 'Present'
            Key = $edgeRegistryPath
            ValueName = 'ProxyMode'
            ValueData = $ProxyMode
            ValueType = 'String'
        }

        # TODO Add functionality to handle more than just 'direct'
    }
}

EdgeProxy