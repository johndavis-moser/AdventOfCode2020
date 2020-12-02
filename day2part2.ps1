cls

$data = Get-Content "C:\AdventOfCode\2020\day2input.txt"
$a = 0

foreach($row in $data){
	$range = $row.Split(" ")[0]
	[int]$minRange = $range.Split("-")[0]
	[int]$maxRange = $range.Split("-")[1]
	$key = $row.Split(" ")[1].Replace(":","")
	$sequence = $row.Split(" ")[2]
	$validCount = 0
	
	if(($sequence[$minRange - 1] -eq $key) -and ($sequence[$maxRange - 1] -ne $key)){
		$a += 1
	}	
	if(($sequence[$maxRange - 1] -eq $key) -and ($sequence[$minRange - 1] -ne $key)){
		$a += 1
	}
}
$a