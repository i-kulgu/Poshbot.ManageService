@{

RootModule = 'PoshBot.ManageService.psm1'

ModuleVersion = '1.0.0'
GUID = '2f1fdfb8-9a1f-4b10-90ef-0b005f418b2c'

Author = 'Ilker Kulgu'
CompanyName = 'Community'
Copyright = '(c) 2018 Ilker Kulgu. All rights reserved'
Description = 'PoshBot plugin to manage services on remote computers'

RequiredModules = @('PoshBot')
FunctionsToExport = '*'
CmdletsToExport = @()
VariablesToExport = @()
AliasesToExport = @()

PrivateData = @{

    Permissions = @(
        @{
            Name = 'service'
            Description = 'Can unlock AD user accounts'
        }
    )
} 
}
