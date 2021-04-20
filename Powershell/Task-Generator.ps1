param ([Parameter(Mandatory=$true)][String]$TaskName
       ,[Parameter(Mandatory=$true)] [ValidateRange(1, [int]::MaxValue)][int]$WaitSeconds)

 <#
   .SYNOPSIS
    Run mytask.ps1 script every minute for given seconds and print all the tasks that are currently running.

    .DESCRIPTION
    Create a new task at the Task scheculer with the given name, the task will run for a given seconds every 1 minute.
    After the given time has pass the task will be disable.
    At the end we will print all the tasks that are currently running.

    .PARAMETER TaskName
    Specifies the task name.
    this parameter is mandatory.

    .PARAMETER WaitSeconds
    Specifies how many seconds the task will be enabled.
    this parameter is mandatory and must be positive.

    .EXAMPLE
    .\Task-Generator.ps1 -TaskName test -WaitSeconds 120
    #>

Function Create-Task (){
    <#
   .DESCRIPTION
    Create a new task at the Task scheculer.
    Task name: $Taskname.
    Action: Execute mytask.ps1 script.
    Triger: Every 1 minute.
    #>

Write-Host "Creating a new task with the name : $TaskName."

$ScheduledTaskActionParams = @{
    Execute  = "PowerShell.exe"
    Argument = "-File mytask.ps1"
    WorkingDirectory = pwd  
}

$TriggerParam = @{
    Once = $true
    At = (Get-Date)
    RepetitionInterval = (New-TimeSpan -Minutes 1)
}

$registerTaskParameters = @{
    Trigger   = New-ScheduledTaskTrigger  @TriggerParam
    TaskName  =  $TaskName
    Action    = New-ScheduledTaskAction @ScheduledTaskActionParams
    }

$task=Register-ScheduledTask @registerTaskParameters -Force 
Start-ScheduledTask -TaskName $TaskName
}

Function Change-TaskStatus (){

   <#
   .DESCRIPTION
    Change the state of the task. disable if running or ready, enable otherwise.
    #>

    $task=Get-ScheduledTask | Where TaskName -eq $TaskName
    if($task.State -eq 'Ready' -Or $task.State -eq "Running"){
           $task=Disable-ScheduledTask -TaskName $TaskName}
     else{$taks=Disable-ScheduledTask -TaskName $TaskName}
}

Function Get-AllTasks (){
    <#
   .DESCRIPTION
    Print all the tasks that are currently running.
    #>

Write-Host "------------------------"
Write-Host "All running tasks:"
 
 $list=Get-ScheduledTask | Get-ScheduledTaskInfo
 Foreach($i in $list){
 echo $i.TaskName
 }

Write-Host "------------------------"
}

Function Stop-Task-Timer(){
    <#
   .DESCRIPTION
    Disable a running task after $WaitSeconds seconds
    #>

$stopwatch = [System.Diagnostics.Stopwatch]::new()
$stopwatch.Start()
while ($stopwatch.Elapsed.TotalSeconds -lt $WaitSeconds){}
$stopwatch.Stop()
echo "Stopping task $TaskName after $WaitSeconds seconds."
Change-TaskStatus
}


Create-Task
Stop-Task-Timer
Get-AllTasks