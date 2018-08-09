# PoshBot.ManageService

Service manager for PoshBot to start / stop / restart a service on a remote computer

# Installation

!ip PoshBot.ManageService

# Permissions

User has to be in group 'service' to use the command

# Usage

There are several possibilities:

!Manage-Service --comp <computer> --serv <service> --status <start | stop | restart>

!service --comp <computer> --serv <service> --status <start | stop | restart>

!ms --comp <computer> --serv <service> --status <start | stop | restart>

You can also use the simple command:

!ms <computer> <service> <start | stop | restart>
