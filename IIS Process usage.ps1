$CPU = @{
Name = 'CPU '
Expression = {
$TotalSec = (New-TimeSpan -Start $_.StartTime).TotalSeconds
[Math]::Round( ($_.CPU * 100 / $TotalSec), 2)
}
}


$processes  = Get-Process | Where{$_.ProcessName -eq "w3wp"}

foreach($process in $processes)

{

$process | SELECT Name, $CPU

}

