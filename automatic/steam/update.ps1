#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe'
$checksumType = 'SHA256'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'              = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType)'"
        }
    }
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $tempFile = New-TemporaryFile
    Invoke-WebRequest -Uri $releases -OutFile $tempFile -UseBasicParsing

    $checksum = Get-FileHash -Algorithm SHA256 -Path $tempFile -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Hash
    $oldChecksum = (Select-String -Path '.\tools\chocolateyinstall.ps1' -Pattern "(checksum\s*=\s*)('.*')").Line.Split("'")[1]

    if ( $checksum -ne $oldChecksum ) {
        $versionDate = Get-Date -Format "yyMMdd"
        $finalVersion = (Get-Item $tempfile).VersionInfo.FileVersion + $versionDate
    } else {
        [xml]$xmlPackage = Get-Content -Path '.\steam.nuspec'
        $finalVersion = $xmlPackage.package.metadata.version
    }

    return @{
        URL          = $releases
        Checksum     = $checksum
        ChecksumType = $checksumType
        Version      = $finalVersion
    }
}

update -ChecksumFor none

