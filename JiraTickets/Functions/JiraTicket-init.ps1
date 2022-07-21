function JiraTicket-init{



<#

.Description

JiraTicket-init initializes login credentials to Jira Server.


#> 



#Connect to Robert Half Jira server
Set-JiraConfigServer -Server "https://jira.roberthalf.com"
get-command -Module PSJira


Write-Output "Enter your Jira credentials"
Start-Sleep -Seconds .7


#$jt.queries.Test


#Login Credentials for Jira

#New-JiraSession Get-Credential -Credential $null
New-JiraSession -Credential (Get-Credential)

$Global:user = Get-JiraUser -Credential $cred

$Global:jt = @{
    "queries" = @{
        "UAB" ='project = ESO AND issuetype = Sub-Task AND status = "Ready for Work" AND labels = SPAM AND assignee in (EMPTY) AND description ~ "Unsafe Attachments Blocked"'
        "Test" = 'text ~ "THIS IS A TEST qwerty"'
    }
}


}