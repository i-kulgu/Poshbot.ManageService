
function Manage-Service {
	<#
	.Synopsis
		Service manager for PoshBot
	.DESCRIPTION
		Service manager for PoshBot to start / stop / restart a service on a remote computer
	.EXAMPLE
		!Manage-Service --comp <computer> --serv <service> --status <start | stop | restart>
		!service --comp <computer> --serv <service> --status <start | stop | restart>
		!ms --comp <computer> --serv <service> --status <start | stop | restart>
	#>
	
	[PoshBot.BotCommand(Aliases = ('service', 'manageservice', 'ms'), Permissions = 'service')]
	[CmdletBinding()]
    Param
    (
        # Name of the Service
        [Parameter(Mandatory=$true)]
        $Comp,
		[Parameter(Mandatory=$true)]
        $Serv,
        [Parameter(Mandatory=$true)]
        [ValidateSet("Stop","Start","Restart")]
        $Status
    )

    # Create a hashtable for the results
    $result = @{}

    # Use try/catch block            
    try
    {
        # Use ErrorAction Stop to make sure we can catch any errors
        if ($Status -eq 'Start') {(Get-Service -ComputerName $Comp -Name "$Serv").Start()}
        elseif ($Status -eq 'Stop') {(Get-Service -ComputerName $Comp -Name "$Serv").Stop()}
        elseif ($Status -eq 'Restart') {Restart-Service -InputObject $(Get-Service -Computer $Comp -Name "$Serv")}
        else {
            $result = "Service $($Serv) does not exist on $Comp."
			$type = "Error"
            exit
            }
        Start-Sleep -Seconds 2
        $service = Get-Service -Name $Serv -ComputerName $Comp -ErrorAction Stop
        
        # Create a string for sending back to slack. * and ` are used to make the output look nice in Slack. Details: http://bit.ly/MHSlackFormat
        $result = "Service $($service.Name) ($($service.DisplayName)) is now ``$($service.Status.ToString())``."
		$type = "Normal"
        
    }
    catch
    {
        # If this script fails we can assume the service did not exist
        $result = "Service $($Serv) does not exist on $Comp."
		$type = "Warning"
    }


	New-PoshBotCardResponse -Type $type -Text $result
}

Export-ModuleMember -Function Manage-Service
