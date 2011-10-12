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
Function global:Get-OSVersion {
  Param( [string]$computer = ".", $credentials )
  If ( $computer -ne "." ) {
    $os = Get-WmiObject Win32_OperatingSystem -ComputerName $computer -Credential $credentials
  } Else {
    $os = Get-WmiObject Win32_OperatingSystem
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