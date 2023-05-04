#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://support.bluestacks.com/hc/en-us/articles/4402611273485-BlueStacks-5-offline-installer'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'              = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
            '(^\s*url64\s*=\s*)(''.*'')'            = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox

    $regexUrl32 = 'BlueStacksFullInstaller_(?<version>[\d.]+)_x86_native.exe'
    $regexUrl64 = 'BlueStacksFullInstaller_(?<version>[\d.]+)_amd64_native.exe'

    $url32 = $page.links | Where-Object href -match $regexUrl32 | Select-Object -First 1 -expand href
    $url64 = $page.links | Where-Object href -match $regexUrl64 | Select-Object -First 1 -expand href

    return @{
        URL32        = $url32
        URL64        = $url64
        Version      = $matches.version
    }
}

update