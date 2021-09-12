function Install-Windows11 {
[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)]
  [String]$FilePath,
  [String]$extraArgs
  ) 
$vol = Mount-DiskImage -ImagePath $FilePath  -PassThru |
	Get-DiskImage | 
	Get-Volume
$installer = '{0}:\setup.exe' -f $vol.DriveLetter
Start-Process $installer -Wait -ArgumentList "/auto upgrade /eula accept $extraArgs"
}
