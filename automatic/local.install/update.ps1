#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://localwp.com/releases/'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'            = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType)'"
        }
    }
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $ieObject = New-Object -ComObject 'InternetExplorer.Application'

    $ieObject.Visible = $true

    $ieObject.Navigate($releases)

    $page = $ieObject.Document

    $regexUrl = '(?<url>https:\/\/cdn.localwp.com\/releases-stable\/(?<version>[\d\.]+)\+[\d]+\/local-[\d\.]+-windows.exe)'

    $search = $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    return @{
        URL          = $matches.url
        Version      = $matches.version
    }
}

update -ChecksumFor none