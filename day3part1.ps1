cls

$data = Get-Content "C:\AdventOfCode\2020\inputs\day3input.txt"
$map = @()
$x = 0
$y = 0
$treeCount = 0
foreach($row in $data){
	$path = ($row)*100
	$map += $path
}
$yBound = $map.Count
$first, $rest = $map

foreach($row in $rest){
	$currentPath = $row
	$x += 3
	$y += 1
	if(($currentPath[$x] -eq "#") -and ($y -ne 1)){
		$treeCount += 1
	}

}
$treeCount
