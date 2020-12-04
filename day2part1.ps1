cls

$data = Get-Content "C:\AdventOfCode\2020\inputs\day2input.txt"
$a = 0

foreach($row in $data){
	$range = $row.Split(" ")[0]
	[int]$minRange = $range.Split("-")[0]
	[int]$maxRange = $range.Split("-")[1]
	$key = $row.Split(" ")[1].Replace(":","")
	$sequence = $row.Split(" ")[2]
	$validCount = 0
	
	foreach($char in $sequence.ToCharArray()){
		if($char -eq $key){
			$validCount += 1
		}		
	}
	
	if(($validCount -ge $minRange) -and ($validCount -le $maxRange)){
		$a += 1			
	}
	
}
$a