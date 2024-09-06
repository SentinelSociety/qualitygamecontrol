Start-DscConfiguration .\WindowsClient -w -v -f
Start-DscConfiguration .\WindowsDefender -w -v -f

# After the following, applications will need inbound/outbound rules made to allow traffic.
Start-DscConfiguration .\WindowsFirewall -w -v -f

Start-DscConfiguration .\DotNetFramework -w -v -f

# After the following, user will be unable to download software from the internet.
# Therefore, software installation should be done before applying these configurations.
Start-DscConfiguration .\Chrome -w -v -f
Start-DscConfiguration .\Edge -w -v -f
Start-DscConfiguration .\Firefox -w -v -f