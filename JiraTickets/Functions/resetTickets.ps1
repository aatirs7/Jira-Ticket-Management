function resetTickets {

<#

.Description

resetTickets provides the capability to reset the tickets updated by the Close-BTP function.

Removes the label, unassigns the ticket, changes status to "Ready for Work", and adds an updated comment.
#> 



 # $Global:JT = @{
  #      "Queries" = @{}
    #    "Config" = @{
    #        "Log" = Import-Clixml .\MyExport.clixml
      #  }
   # }


   # Update log    
   # $JT.Config.Log += [pscustomobject]@{
      #  "Key" = "ESO-000000$($num)"
       # "Date" = (date)
    #}

    # Also export it
   # $Global:JT.Config.Log | Export-Clixml MyExport.clixml



$jiraTickets = Get-JiraIssue -Query $global:jt.queries.Test


$ticket = Get-JiraIssue -Query $global:jt.queries.Test| Select-Object "key" 

$ticket | Out-Host
Start-Sleep 1

$ans = Read-Host "Reset these tickets?"


if($ans -eq "Yes"){

$comment = Read-Host "Add updated comment"



for ($i=0; $i -lt $jiraTickets.Count; $i++){
Add-JiraIssueComment -Comment "$comment" -Issue $jiraTickets[$i]
}

Set-JiraIssue -Issue $jiraTickets -Assignee "Unassigned" | Out-Null
Set-JiraIssueLabel -Issue $jiraTickets -Set 'SPAM' | Out-Null
Get-JiraIssue $jiraTickets | Invoke-JiraIssueTransition -Transition 25







#create array of completed tickets
#add new comment explaining, take a user input comment
#keep log of all updated tickets, 

#problem, action, solution

#each ticket takes x mins, saving this x amount of time by using this script

}


$tickCount = $ticket.Count


Write-Host "The following $tickCount tickets have been reset"
$ticket | Out-Host




}




