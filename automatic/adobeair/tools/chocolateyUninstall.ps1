$package = 'AdobeAIR'

# http://forums.adobe.com/message/4677900
$airInstall = 'Adobe AIR\Versions\1.0'
$airPath = $Env:CommonProgramFiles, ${Env:CommonProgramFiles(x86)} |
% { Join-Path $_ $airInstall } |
? { Test-Path $_ } |
Select -First 1
$airSetup = Join-Path $airPath 'setup.msi'


try {
    # http://stackoverflow.com/questions/450027/uninstalling-an-msi-file-from-the-command-line-without-using-msiexec
    $msiArgs = '/x "'+$airSetup+'" /qb-! REBOOT=ReallySuppress'
    Start-ChocolateyProcessAsAdmin "$msiArgs" 'msiexec'

    $airDir = Join-Path ${Env:CommonProgramFiles(x86)} '\Adobe AIR'
    Remove-Item $airDir -Recurse -ErrorAction SilentlyContinue
} catch {
    throw "$($_.Exception.Message)"
}

