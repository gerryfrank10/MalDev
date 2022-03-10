$Assemblies = [System.AppDomain]::CurrentDomain.GetAssemblies()

$Assemblies | 
    ForEach-Object {
        $_.Location
        $_.GetTypes() |
            ForEach-Object {
                $_ | Get-Member -Static | Where-Object {
                    $_.TypeName.Equals("Microsoft.Win32.UnsafeNativeMethods")
                    }
                } 2> $null
      }

