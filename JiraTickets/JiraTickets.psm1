
Function Utils-Get-FunctionNames {
 [CmdletBinding()]
 Param
(
 [Parameter()]
  [ValidateScript({Test-Path $_ })]
 [string]$Path
 )
  if($Path -notmatch "Functions") {$function_root = $Path + "\Functions"}
  else{$function_root = $Path}
 dir $function_root -Filter "*.ps1" | %{$_.BaseName}
}










#----------------------------Include functions---------------------------
# KUDOS to the chocolatey project for the basis of this code

# get the path of where the module is saved (if module is at c:\myscripts\module.psm1, then c:\myscripts\)
$mypath = (Split-Path -Parent -Path $MyInvocation.MyCommand.Definition)

# find and load all the ps1 files in the Functions subfolder
Resolve-Path -Path $mypath\Functions\*.ps1 | ForEach-Object -Process {
    . $_.ProviderPath
}


#----------------------------Exports---------------------------
# Cmdlets to export (must be exported as functions, not cmdlets) - This array format can be copied directly to the module manifest as the 'FunctionsToExport' value
$ExportedCommands = Utils-Get-FunctionNames -Path $mypath

$ExportedCommands | ForEach-Object {Export-ModuleMember -Function $_}

