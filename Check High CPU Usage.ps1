$repeat_count = 3
$cpu_threshold = 85
$sleep_interval = 1
$hit = 0
foreach($turn in 1..$repeat_count) {
$cpu = (gwmi -class Win32_Processor).LoadPercentage
#write-host “CPU utilization is Currently at $cpu`%”
If($cpu -ge $cpu_threshold) {
$hit = $hit+1
}
start-sleep $sleep_interval
}

if($hit -eq 3) {
write-host “CPU utilization is over threshold”
} else {
write-host “CPU utilization is below threshold level”
}