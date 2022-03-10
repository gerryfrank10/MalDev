function LooKUpFunc {

    Param ($modulename, $functionname)
    $assem = ([System.AppDomain]::CurrentDomain.GetAssemblies() | Where-Object {
        $_.GlobalAssemblyCache -and $_.Location.Split('\\')[-1].Equals("System.dll") }).GetType("Microsoft.Win32.UnsafeNativeMethods")

        $tmp = @()
        $GetModuleHandle = $assem.GetMethod("GetModuleHandle")

        $assem.GetMethods() | ForEach-Object { if ($_.Name -eq "GetProcAddress" ) {$tmp+=$_}}
        return $tmp[0].Invoke($null, @($assem.GetMethod("GetModuleHandle").Invoke($null, @($modulename)), $functionname)) 
}

$MessageBoxA = LooKUpFunc user32.dll MessageBoxA