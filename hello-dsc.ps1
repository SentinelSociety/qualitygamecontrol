Configuration ExampleConfiguration
{
     Import-DSCResource -ModuleName nx

Node  "linuxhost.contoso.com"
     {
         nxFile ExampleFile
         {
             DestinationPath = "/tmp/example"
             Contents = "hello world `n"
             Ensure = "Present"
             Type = "File"
         }
     }
}

ExampleConfiguration -OutputPath:"C:\temp"