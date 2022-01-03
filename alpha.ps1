$t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'                   #This is for making the console close almost the moment its opened
add-type -name win -member $t -namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle, 0)



$FullPathToEXE = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
$loc = [System.IO.Path]::GetDirectoryName($FullPathToEXE)
echo $loc
cd $loc
$a = get-location
echo "$a"
[array]$l = Get-Content "INFO.txt"      
Invoke-Item $l[0]
start-process 'C:\Omega\Omega.exe' -Wait -WindowStyle Hidden
