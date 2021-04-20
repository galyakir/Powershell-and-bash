# Week 2 project


## PowerShell script
This is a simple PowerShell script that will write "I love the boot camp!" every minute.

The script will create a new task at the task scheduler with the name `TaskName` 
and the script will be enable for `WaitSeconds` seconds.

**Mandatory flags:**

`-TaskName` - flgs for name of task.

`-WaitSeconds`- flgs for time in seoonds until disable.

**Install and Configuration:**

1. Clone or download source files.
2. Run ` .\Task-Generator.ps1 -TaskName [task name] -WaitSeconds [number of seconds]` using windows PowerShell or add powershell.exe when using reguler cmd.

## Bash script
This is a simple Bash script that will validate if a password is a strong passowrd.

**Strong password:**

1. Length – minimum of 10 characters.
2. Contain both alphabet and number.
3. Include both the small and capital case letters.

**Install and Configuration:**

1. Clone or download source files.
2. Run `chmod 777 password_validator.sh`
3. run ./password-validator.sh [password] to validate the password.

## Bonus script
This bash script will build  WeightTracker App and deploy app and DB automatically.

WeightTracker App link: https://github.com/galyakir/node-weight-tracker

This script works at Ubuntu operation system

**Mandatory flags:**

         -u     okta url
         -i     okta ID
         -s     okta SECRET
         -h     postgresql host
         -p     postgresql password
         
**Optional flags:**

        -n postgresql username default=postgres
        -d postgresql database default=postgres
        -r postgresql post default=5432
        
**Install and Configuration:**
1.  Clone or download source files.
2.  Create a [free Okta developer account](https://developer.okta.com/) and add a web application for this app.
3.  Create PostgreSQL DB.
4.  Run `chmod 777 deploy.sh`
5.  run `./deploy.sh -u {okta url} -i {okta id} -s {okta secret} -h {postgresql host} -p {postgresql password}`
