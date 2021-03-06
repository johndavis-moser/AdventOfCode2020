cls

$data = Get-Content "C:\AdventOfCode\2020\inputs\day5input.txt"
$ids = @()

foreach($line in $data){
	$positions = $line.ToCharArray()
	$rowStartIndex = 0
	$rowEndIndex = 127
	$colStartIndex = 0
	$colEndIndex = 7
	$x = 0
	$y = 0
	$rows = 0..127
	$cols = 0..7
	foreach($position in $positions){
		if($position -eq "F"){
			$x = ($rows.Length / 2) - 1
			$rows = $rows[$rowStartIndex..$x]
			$rowStartIndex = 0
			$rowEndIndex = $x		
		}
		elseif($position -eq "B"){
			$x = $rows.Length / 2
			$rows = $rows[$x..$rows.Length]
		}		
		elseif($position -eq "L"){
			$y = ($cols.Length / 2) - 1
			$cols = $cols[$colStartIndex..$y]
			$colStartIndex = 0
			$colEndIndex = $y
		}
		elseif($position -eq "R"){
			$y = $cols.Length / 2
			$cols = $cols[$y..$cols.Length]
		}
	}
	[int]$x = $rows[0]
	[int]$y = $cols[0]
	$ids += (($x * 8) + $y)
}

$ids | sort 
