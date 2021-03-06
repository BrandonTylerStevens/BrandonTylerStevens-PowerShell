#========================================================================
# Created with: SAPIEN Technologies, Inc., PowerShell Studio 2012 v3.1.34
# Created on:   01/20/2018
# Created by:   Brandon Stevens
# Filename:     Get-NameSpace.ps1
#========================================================================
Function Get-WmiNameSpace
{
 Param(
  $nameSpace = "root",
  $computer = "localhost"
 )
 Get-WmiObject -class __NameSpace -computer $computer `
 -namespace $namespace -ErrorAction "SilentlyContinue" |
 Foreach-Object `
 -Process `
   { 
     $subns = Join-Path -Path $_.__namespace -ChildPath $_.name
     if($subns -notmatch 'directory') {$subns} 
     $namespaces += $subns + "`r`n"
     Get-WmiNameSpace -namespace $subNS -computer $computer
   } 
} #end Get-WmiNameSpace