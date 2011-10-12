# ewall's PowerShell Profile

# alias common cmdlets
Set-Alias -Name ^         -Value Select-Object
Set-Alias -Name ~         -Value Sort-Object
Set-Alias -Name w         -Value Write-Host
Set-Alias -Name out-csv   -Value Export-Csv
Set-Alias -Name in-csv    -Value Import-Csv
Set-Alias -Name out-html  -Value ConvertTo-Html
Set-Alias -Name which     -Value Get-Command
Set-Alias -Name ll        -Value Get-ChildItem

# useful functions

# from my PS class
Function global:Get-OSVersion {
  Param( [string]$computer = ".", $credentials )
  If ( $computer -ne "." ) {
    $os = Get-WmiObject Win32_OperatingSystem -ComputerName $computer -Credential $credentials;
  } Else {
    $os = Get-WmiObject Win32_OperatingSystem;
  }
  Switch ($os.BuildNumber) {
    2195    { $osver = "2000" }
    2600    { $osver = "XP" }
    3790    { $osver = "2003" }
    6000    { $osver = "Vista" }
    default { $osver = "2008" }
  }
  Return $osver
}

# from http://blogs.technet.com/b/heyscriptingguy/archive/2010/07/11/hey-scripting-guy-weekend-scripter-checking-for-module-dependencies-in-windows-powershell.aspx
Function global:Get-MyModule {
  Param( [string]$name )
  If (-not (Get-Module -name $name)) {
    If (Get-Module -ListAvailable | Where-Object { $_.name -eq $name }) {
      Import-Module -Name $name;
      $true; # return success
    } Else {
      $false; # failed to locate the module
    }
  } Else {
   $true; # module already loaded
  }
}
