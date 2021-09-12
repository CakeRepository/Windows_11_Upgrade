function Install-Windows11 {
[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)]
  [String]$url,
  [String]$extraArgs
  ) 
$savePath = "c:\windows\temp\win11.iso"

$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile($url,$savePathi);  

$vol = Mount-DiskImage -ImagePath $FilePath  -PassThru |
	Get-DiskImage | 
	Get-Volume
$installer = '{0}:\setup.exe' -f $vol.DriveLetter
Start-Process $installer -Wait -ArgumentList "/auto upgrade /eula accept $extraArgs"
}
