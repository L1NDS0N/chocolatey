$ErrorActionPreference = 'Stop'

$packageName = 'sqlbackupandftp'
$softwareName = 'SQL Backup and FTP*'

$uninstallKey = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($uninstallKey) {
    $file = "$($uninstallKey.UninstallString)"
    
    if ($file) {
        Uninstall-ChocolateyPackage -PackageName $packageName `
                                    -FileType 'EXE' `
                                    -SilentArgs "/S" `
                                    -File "$file" `
                                    -ValidExitCodes @(0)
    }
}

Write-Warning "$packageName uninstall completed or software not found."