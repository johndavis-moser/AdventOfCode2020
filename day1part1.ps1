cls

$data = Get-Content "C:\AdventOfCode\2020\day1input.txt"

foreach($row in $data){
	[int]$x = $row
	[int]$y = 2020 - $x
	[int]$a = $x * $y
	if($data.Contains($y))	{
		Write-Host $a
		break
	}
}