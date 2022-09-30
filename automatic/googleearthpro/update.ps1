#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://support.google.com/earth/answer/168344?hl=en'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'              = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType32)'"
            '(^\s*url64\s*=\s*)(''.*'')'            = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $regexUrl32 = '\/googleearthprowin-(?<version>[\d\.]+).exe'
    $regexUrl64 = '\/googleearthprowin-(?<version>[\d\.]+)-x64.exe'

    $url32 = $page.links | Where-Object href -match $regexUrl32 | Select-Object -First 1 -expand href
    $url64 = $page.links | Where-Object href -match $regexUrl64 | Select-Object -First 1 -expand href

    $checksum32 = Get-RemoteChecksum $url32
    $oldChecksum32 = (Select-String -Path '.\tools\chocolateyinstall.ps1' -Pattern "(checksum\s*=\s*)('.*')").Line.Split("'")[1]
    $checksum64 = Get-RemoteChecksum $url64
    $oldChecksum64 = (Select-String -Path '.\tools\chocolateyinstall.ps1' -Pattern "(checksum64\s*=\s*)('.*')").Line.Split("'")[1]

    if ( ($checksum32 -ne $oldChecksum32) -or ($checksum64 -ne $oldChecksum64) ) {
        $versionDate = Get-Date -Format "ddMMyyyy"
        $finalVersion = $matches.version + "." + $versionDate
    } else {
        $finalVersion = (Select-String -Path '.\googleearthpro.nuspec' -Pattern "<version>([\d\.]+)<\/version>")
    }

    return @{
        URL32        = $url32
        URL64        = $url64
        Version      = $finalVersion
    }
}

update