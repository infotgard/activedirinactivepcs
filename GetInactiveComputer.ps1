import-module activedirectory 

$DaysInactive = 30 #change the days if you want
$time = (Get-Date).Adddays(-($DaysInactive))

Get-ADComputer -Filter {LastLogonTimeStamp -lt $time} -Properties LastLogonTimeStamp |
select-object Name | ConvertTo-Csv -NoTypeInformation | % { $_ -replace '"', ""} | Select-Object -Skip 1 |out-file "OLD_Computer.csv" -fo -en ascii

$COMPUTERS = get-content "OLD_Computer.csv"
$COMPUTERS|Foreach{
Get-ADComputer $_ | Disable-ADAccount 
Get-ADComputer $_ | Move-ADObject -TargetPath "ou=PCDisabled,dc=domainname,dc=com"}
