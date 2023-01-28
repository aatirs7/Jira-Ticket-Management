# Jira Ticket Management Scripts

This repository contains a set of PowerShell scripts for managing Jira tickets. The scripts use the JiraPS module to interact with a Jira instance.

# Scripts

* Close-BTP.ps1

  * This script is used to close "Beyond SLA" Jira tickets. The script queries for tickets that meet certain criteria (e.g. status, assignee, label) and then takes a   specific set of actions on those tickets (e.g. transition to a closed state, add a comment, remove a label).

* JiraTicket-init.ps1

  * This script is used to initialize the connection to Jira and sets up the global variables that the other scripts will use to interact with Jira.

* resetTickets.ps1

  * This script provides the capability to reset the tickets updated by the Close-BTP function. Removes the label, unassigns the ticket, changes status to "Ready for Work", and adds an updated comment

* JiraTickets.psm1

   * This is a PowerShell module file that contains the functions and exported commands for use in other scripts.

# Prerequisites

* PowerShell version 3.0 or later

* JiraPS module installed

# Setup

* Install the JiraPS module by running Install-Module JiraPS in PowerShell.

* Clone or download this repository.

* Update the JiraTicket-init.ps1 script with your Jira instance URL and credentials.

* Run the JiraTicket-init.ps1 script to initialize the connection to Jira.

* Run the other scripts as needed.

# Usage

* Each script has its own set of parameters and usage instructions. Please refer to the inline comments in each script for more information.

Limitations
These scripts have been tested with a specific Jira instance and may need to be modified to work with other instances.
These scripts are provided as-is and are not guaranteed to work in all environments.
Future updates
Improve the commenting of the scripts
Add more functionality, such as logging, for better tracking and auditing of the actions taken by the scripts
Improve the error handling of the scripts
Add more scripts to cover a larger range of use cases for managing Jira tickets.
