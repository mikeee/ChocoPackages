#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases = 'http://download.msi.com/uti_exe/vga/MSIAfterburnerSetup.zip?__token__=' + $(Invoke-RestMethod https://www.msi.com/api/v1/get_token?date=$(Get-Date -format "yyyyMMddHH"))

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(?i)(^\s*\$checksum\s*=\s*)(''.*'')'           = "`$1'$($Latest.Checksum)'"
            '(?i)(^\s*\$checksumType\s*=\s*)(''.*'')'       = "`$1'$($Latest.ChecksumType)'"
        }
    }
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $releaseUrl = "https://www.guru3d.com/files-details/msi-afterburner-beta-download.html"

    $page = Invoke-WebRequest -Uri $releaseUrl -UseBasicParsing

    $regexVersion = 'MSI[\s]+Afterburner[\s]+(?<version>[\d.]+)'

    $matched = $page.Content -match $regexVersion

    if ($matched -ne $true) {
        throw 'Unable to obtain software version'
    }

    $checksum = Get-RemoteChecksum $releases
    $oldChecksum = (Select-String -Path '.\tools\chocolateyinstall.ps1' -Pattern "(checksum\s*=\s*)('.*')").Line.Split("'")[1]

    if ($checksum -ne $oldChecksum) {
        $versionDate = Get-Date -Format "yyMMdd"
        $finalVersion = $matches['version'] + "." + $versionDate
    } else {
        [xml]$xmlPackage = Get-Content -Path '.\msiafterburner.nuspec'
        $finalVersion = $xmlPackage.package.metadata.version
    }

    return @{
        Version     = $finalVersion
        Checksum    = $checksum
    }
}

Update-Package