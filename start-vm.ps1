	param 
	(		
	    [Parameter(Mandatory=$true)]
	    [string]
		$azureAccountName,
			
		[Parameter(Mandatory=$true)]
	    [string]
		$Password,
			
		[Parameter(Mandatory=$true)]
	    [string]
		$rgName,
			
		[Parameter(Mandatory=$true)]
	    [string]
		$vmName
	)
	
	$azurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
	
	$psCred = New-Object System.Management.Automation.PSCredential($azureAccountName, $azurePassword)

	Login-AzureRmAccount -Credential $psCred

	Start-AzureRmVM -ResourceGroupName $rgName -Name $vmName
