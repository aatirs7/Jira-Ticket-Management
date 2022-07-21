function Close-BTP {


<#
.Description

Close-BTP Pulls and updates tickets from the specified jira ticket queue. 

Adds a comment, assigns to current user, adds labels, and resolves ticket.
#> 

$jiraTickets = Get-JiraIssue -Query $global:jt.queries.Test


$tickets = Get-JiraIssue -Query $global:jt.queries.Test| Select-Object "key" 
#Prod level query
#project = ESO AND issuetype = Sub-Task AND status = "Ready for Work" AND labels = SPAM AND assignee in (EMPTY) AND description ~ "Unsafe Attachments Blocked"



Write-Output "`nThe following tickets have Unsafe Attachments Blocked"
$tickets | Out-Host
Start-Sleep 1
$answer = Read-Host "Make changes to these tickets? "


if($answer -eq "Yes"){

#Assigns ticket to current user

Set-JiraIssue -Issue $jiraTickets -Assignee $Global:user | Out-Null



#Add BTP Label to current ticket
$Labels = @('BTP')
$jiraTickets | Set-JiraIssueLabel -Add $Labels | Out-Null

#Add comment to all tickets
for ($i=0; $i -lt $jiraTickets.Count; $i++){
Add-JiraIssueComment -Comment "BTP - Blocked Malicious Web/AttachmentThis email originally contained an link that direct to malicious website or malware attachment or unavailable website. However, when detonated links in sandbox, it appear the the malicious website has been blocked either by RH or O365 ATP or 3rd party site. Thus this can be considered benign." -Issue $jiraTickets[$i]
}

$count = $jiraTickets.Count

#Resolves Issue using transition
Get-JiraIssue $jiraTickets | Invoke-JiraIssueTransition -Transition 65


#$resolved = 


Write-Output "The process is complete`n"
Write-Output "$count BTP tickets were resolved`n"
Start-Sleep 1
Write-Output "The following tickets were updated "
$tickets | Out-Host

Start-Sleep -Seconds 1.2



}else{


Write-Host "`nNo action executed, ending process..... `n"
Start-Sleep .6
Write-Host "Process Complete `n"

}



}
