#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1
$releases   = 'http://app.pc.kakao.com/talk/win32/patch/patch.txt'
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
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $regexPage = '(?<version>[\d]+\.[\d]+\.[\d]+\.[\d]+)'

    $matched = $page.Content -match $regexPage
    
    If ($False -ne $matched) {
        $version = $matches["version"]
    }

    return @{
        URL        = $release
        Version    = $version
    }
}

update -ChecksumFor none