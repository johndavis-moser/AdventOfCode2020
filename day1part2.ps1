cls

$data = Get-Content "C:\AdventOfCode\2020\inputs\day1input.txt"
$currentIndex = 0
foreach($row in $data) {
	$index1 = 0
	[int]$x = $row
	foreach($row in $data) {
		[int]$y = $row
		if(($y -eq $x) -and ($index1 -eq $currentIndex)){
			$currentIndex += 1
		}
		else {
			[int]$z = (2020 - $x) - $y
			if($data.Contains($z)) {
				Write-Host (($x * $y) * $z)
				break
			}
			else {
				$currentIndex += 1
			}
		}
	}
	if($data.Contains($z)) {
		break
	}
}