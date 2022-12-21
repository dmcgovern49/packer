$action = New-ScheduleedTaskAction -Execute 'Powershell.exe' `

-Argument '-NoProfile -WindowStyle Hidden -command "& Get-ChildItem –Path "C:\Windows\temp" -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-30))} | Remove-Item"'
$trigger = New-ScheduleedTaskAction -Daily -At 9pm
Register-ScheduleedTaskAction -action $action -trigger $trigger -TaskName "Cleanup-temp" -Description "Daily cleanup of C:\Windows\temp"