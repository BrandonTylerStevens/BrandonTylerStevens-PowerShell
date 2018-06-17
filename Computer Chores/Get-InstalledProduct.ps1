﻿# -----------------------------------------------------------------------------------------
# Script: Get-InstalledProduct.ps1
# Author: Brandon Stevens
# Date: May 4, 2015
# Version: 1.0
# Purpose: This script is used query the status of an installed product on desktop computers
#------------------------------------------------------------------------------------------

<#
    .SYNOPSIS
    
        Management Classes is used instead of the WMI Win32_Product Class, because the Win32_Product Class is ging to enumerate
        all of the applications installed on the computer and run the reconfigure option on each installed application. This can potential
        affect the installation of application and slows down the retreival of the application information.

    .PARAMETER GUID
        The installed Product GUID.

    .PARAMETER Name
        The installed Product name.

    .PARAMETER Version
        The installed Product version.

    .Example
        Get-InstalledProduct.ps1 -GUID {109A5A16-E09E-4B82-A784-D1780F1190D6} -Name Windows Firewall Configuration Provider -Version 1.2.3412.0

    .Link 
        https://toolsmith.brycoretechnologies.com
#>

#Requires -version 3

[CmdletBinding()]
 Param (
    $ComputerName = $env:COMPUTERNAME,

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$GUID,
    
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$Name,

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$Version
    
 )


if (Test-Connection -Computer $ComputerName -Count 1 -BufferSize 16 -Quiet ) {


    try {

        

        $opt = New-CimSessionOption -Protocol DCOM

        # Get the OS version for client computers.
        # ProductType = 1 designate a desktop computer
        $os_params = @{
            'Class' = 'Win32_OperatingSystem ';
            'CimSession' = $csd;
            'Filter' = 'ProductType = "1"';
            'ErrorAction' = 'Stop'
        }


        $OSVersion = (Get-CimInstance @os_params).version 

        # If we did not get anything, ie not client computer bail out.
        if (!$OSVersion) {
            return
        }

    
        # We are going to use the System.Management classes to get the product instead of the
        # Win32_product class. This is because the Win32_Product class is going to enumerate 
        # all of the installed products on the computer and run the reconfigure option on all of them.
        # This will slow down getting the product information and the reconfiguration of sofwtare on production
        # computers could be an issue

        # Code based on http://stackoverflow.com/questions/3577338/using-wmi-to-uninstall-applications-remotely
        $connoptions = New-Object System.Management.ConnectionOptions

        if ($cred) {

            $networkCred = $cred.GetNetworkCredential()
            $connoptions.Username=$networkCred.Domain.ToString() + "\" + $networkCred.UserName.ToString()
        }
        

        #$InstalledProduct

        if ($InstalledProduct) {

     }
     catch {
  
       if ($_.Exception.InnerException) {
       
     }
     

}
else {
  
  "Could not connect to computer $ComputerName ...`r`n" 


}