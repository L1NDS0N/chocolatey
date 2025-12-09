$ErrorActionPreference = 'Stop';

$packageName = 'sqlbackupandftp'
$installerType = 'exe'
$silentArgs = '/S'
$validExitCodes = @(0)

Uninstall-ChocolateyPackage -PackageName $packageName `
                            -FileType $installerType `
                            -SilentArgs $silentArgs `
                            -ValidExitCodes $validExitCodes
