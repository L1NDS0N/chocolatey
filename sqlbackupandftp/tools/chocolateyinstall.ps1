$ErrorActionPreference = 'Stop';

$packageUrl = 'https://sqlbackupandftp.com/home/downloadlatestversion'
$packageName = 'sqlbackupandftp'
$installerType = 'exe'
$silentArgs = '/S'
$validExitCodes = @(0)
$checksum = '840757768E3CB8E0E81DD6593CD2F120EE608583483F42F505F752263A718515'
$checksumType = 'sha256'

$toolsDir   = Split-Path -Parent $MyInvocation.MyCommand.Definition
$installerPath = Join-Path $toolsDir 'SQLBackupAndFTPSetup.exe'

Get-ChocolateyWebFile -PackageName $packageName `
                      -FileFullPath $installerPath `
                      -Url $packageUrl `
                      -Checksum $checksum `
                      -ChecksumType $checksumType

Install-ChocolateyInstallPackage -PackageName $packageName `
                                 -FileType $installerType `
                                 -SilentArgs $silentArgs `
                                 -ValidExitCodes $validExitCodes `
                                 -File $installerPath
