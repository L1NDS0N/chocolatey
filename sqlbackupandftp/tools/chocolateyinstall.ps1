$ErrorActionPreference = 'Stop';

$packageUrl = 'https://sqlbackupandftp.com/home/downloadlatestversion'
$packageName = 'sqlbackupandftp'
$installerType = 'exe'
$silentArgs = '/S'
$validExitCodes = @(0)

$toolsDir   = Split-Path -Parent $MyInvocation.MyCommand.Definition
$installerPath = Join-Path $toolsDir 'SQLBackupAndFTPSetup.exe'

Get-ChocolateyWebFile -PackageName $packageName `
                      -FileFullPath $installerPath `
                      -Url $packageUrl

Install-ChocolateyInstallPackage -PackageName $packageName `
                                 -FileType $installerType `
                                 -SilentArgs $silentArgs `
                                 -ValidExitCodes $validExitCodes `
                                 -File $installerPath
