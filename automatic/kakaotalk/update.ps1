#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$release    = 'https://app-pc.kakaocdn.net/talk/win32/KakaoTalk_Setup.exe'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'              = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum = Get-RemoteChecksum $Latest.URL
    $Latest.ChecksumType = 'SHA256'
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $tmpFile = "$env:TEMP\KakaoTalk_Setup.exe"
    Invoke-WebRequest -UseBasicParsing -Uri $release -OutFile $tmpFile
    $versionInfo = Get-Item $tmpFile | % versioninfo

    return @{
        URL        = $release
        Version    = $versionInfo.ProductVersion
    }
}

Update-Package