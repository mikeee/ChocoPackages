#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1
$releaseBase = 'https://lk.kakaocdn.net/talkpc/talk/win32'
$releases    = "$releaseBase/patch/patch.txt"
$release     = "$releaseBase/KakaoTalk_Setup.exe"

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
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $fullPackage = [regex]::Match(
        $page.Content,
        '(?m)^kakaotalk_\d+(?:\.\d+){3}_full\.pak'
    ).Value
    if (-not $fullPackage) {
        throw "Unable to find the current full package in '$releases'."
    }

    $versionedRelease = "$releaseBase/patch/$fullPackage"
    $url = '{0}?version={1}' -f $release, (Get-Version $versionedRelease)

    return @{
        URL        = $url
        Version    = Get-Version $url
    }
}

update -ChecksumFor none