cls

$data = Get-Content "C:\AdventOfCode\2020\inputs\day3input.txt"
$map = @()
$x = 0
$y = 1
$treeCount = 0
foreach($row in $data){
	$path = ($row)*100
	$map += $path
}
$first, $rest = $map
$second, $last = $rest

foreach($row in $last){
	$currentPath = $row
	$y += 1
	if($y % 2 -eq 0){	
		$x += 1
		if($currentPath[$x] -eq "#"){
			$treeCount += 1
		}
	}
}
$treeCount
