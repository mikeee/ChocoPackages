#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://www.superantispyware.com/downloadfile.html?productid=SUPERANTISPYWAREFREE'

$uninst      = 'https://www.superantispyware.com/downloads/SASUNINST.EXE'
$uninst64    = 'https://www.superantispyware.com/downloads/SASUNINST64.EXE'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"                = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"           = "`$1'$($Latest.Checksum)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"       = "`$1'$($Latest.ChecksumType)'"
        }
        ".\tools\chocolateyUninstall.ps1" = @{
            '(?i)(^\s*\$checksum\s*=\s*)(''.*'')'       = "`$1'$($Latest.uCS)'"
            '(?i)(^\s*\$checksum64\s*=\s*)(''.*'')'     = "`$1'$($Latest.uCS64)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum = Get-RemoteChecksum $Latest.Url
    $Latest.ChecksumType = 'SHA256'

    $Latest.uCS = Get-RemoteChecksum $uninst
    $Latest.uCS64 = Get-RemoteChecksum $uninst64
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $regexPage = 'Version:[\s]+(?<version>[\d.]+)'

    $matched = $page.Content -match $regexPage

    $version = $matches["version"]

    $url = "https://securedownloads.superantispyware.com/SUPERAntiSpyware.exe"

    return @{
        URL        = $url
        Version      = $version
    }
}

update -ChecksumFor none