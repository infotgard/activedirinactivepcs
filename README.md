# activedirinactivepcs
Get inactive computers using Powershell and Domain Controller Objects in your AD and disable them while transferring them to a container.

You must execute this script on your Domain Controller only. Executing this on another domain pc requires elevated privileges 
which can make your DC vulnerable. 

You can change the period of inactivity, default to 30 days. 

You can create and or change the Container where the disabled PCs while be moved to, default is "PCDisabled".

To automate this script you can add it to Task Scheduler.
