cls

$data = Get-Content "C:\AdventOfCode\2020\inputs\day4input.txt"
$passports = @()
$currentCred = ""

foreach($row in $data){
	$cred = $row
	if([string]::IsNullOrEmpty($cred)){
		$passports += $currentCred
		$currentCred = ""
	}
	else{
		$currentCred += $cred + " "
	}
}
$validCount = 0
foreach($passport in $passports){
	$fields = $passport.Split(" ")
	$keys = @()
	foreach($field in $fields){
		if(! [string]::IsNullOrEmpty($field)){
			$keys += $field.Substring(0,3)
		}
	}
	if(($keys -like "*byr*") -and ($keys -like "*iyr*") -and ($keys -like "*eyr*") -and ($keys -like "*hgt*") -and ($keys -like "*hcl*") -and ($keys -like "*ecl*") -and ($keys -like "*pid*")  -and ($keys -like "*cid*")){
		$validCount += 1
	}
	elseif(($keys -like "*byr*") -and ($keys -like "*iyr*") -and ($keys -like "*eyr*") -and ($keys -like "*hgt*") -and ($keys -like "*hcl*") -and ($keys -like "*ecl*") -and ($keys -like "*pid*")){
		$validCount += 1
	}
}
$validCount
