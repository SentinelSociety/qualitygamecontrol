Configuration CreateFirewallRule {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ProgramPath,

        [Parameter(Mandatory = $true)]
        [string]$RuleName
    )

    Import-DscResource -ModuleName xNetworking

    Node localhost {
        xFirewall FirewallRule {
            Name          = $RuleName
            Ensure        = 'Present'
            Direction     = 'Inbound'
            Program       = $ProgramPath
            Action        = 'Allow'
            Profile       = 'Any'
        }
    }
}

# Example usage for Mission Planner
CreateFirewallRule -ProgramPath 'C:\program files (x86)\mission planner\missionplanner.exe' -RuleName 'Allow Mission Planner'
Start-DscConfiguration -Path .\CreateFirewallRule -Wait -Verbose

# Example usage for QGroundControl
CreateFirewallRule -ProgramPath 'C:\program files\qgroundcontrol\qgroundcontrol.exe' -RuleName 'Allow QGroundControl'
Start-DscConfiguration -Path .\CreateFirewallRule -Wait -Verbose
