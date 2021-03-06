#========================================================================
# Created with: SAPIEN Technologies, Inc., PowerShell Studio 2012 v3.1.34
# Created on:   01/20/2018
# Created by:   Brandon Stevens
# Filename:     Get-WmiProvider.ps1
#========================================================================
Function Get-WmiProvider
{
 Param(
  $nameSpace = "root\cimv2",
  $computer = "localhost"
 )
  Get-WmiObject -class __Provider -namespace $namespace | 
  Sort-Object -property Name | 
  Select-Object name
} #end function Get-WmiProvider
