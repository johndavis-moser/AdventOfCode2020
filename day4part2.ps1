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
			$key = $field.Split(":")[0]
			$value = $field.Split(":")[1]			
			if($key -eq "byr"){
				if(($value -ge 1920) -and ($value -le 2002)){
					$keys += $key
				}
			}
			elseif($key -eq "iyr"){
				if(($value -ge 2010) -and ($value -le 2020)){
					$keys += $key
				}
			}
			elseif($key -eq "eyr"){
				if(($value -ge 2020) -and ($value -le 2030)){
					$keys += $key
				}
			}
			elseif($key -eq "hgt"){
				if($value -like "*cm*"){
					$value = $value.Replace("cm","")
					if(($value -ge 150) -and ($value -le 193)){
						$keys += $key
					}
				}
				elseif($value -like "*in*"){
					$value = $value.Replace("in","")
					if(($value -ge 59) -and ($value -le 76)){
						$keys += $key
					}
				}
			}
			elseif($key -eq "hcl"){
				if(($value.Substring(0,1) -eq "#") -and ($value.Length -eq 7)){
					if($value.Substring(1,6) -match "[a-f_0-9]"){
						$keys += $key
					}
				}
			}
			elseif($key -eq "ecl"){
				if(($value -like "amb") -or ($value -like "blu") -or ($value -like "brn") -or ($value -like "gry") -or ($value -like "grn") -or ($value -like "hzl") -or ($value -like "oth")){					
					$keys += $key					
				}
			}
			elseif($key -eq "pid"){
				if(($value.Length -eq 9) -and ($value -match "[0-9]")){					
					$keys += $key					
				}
			}
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
