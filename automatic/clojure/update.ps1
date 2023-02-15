#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://www.clojure.org/guides/install_clojure'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'              = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType)'"
        }
        ".\tools\chocolateyUninstall.ps1" = @{
            '(\$packageVersion\s*=\s*)('.*')'              = "`$1'$($Latest.Version)'"
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
    $regexVersion = 'https:\/\/download.clojure.org\/install\/linux-install-(?<version>[\d.]+).sh'

    $matched = $page.Content -match $regexVersion

    If ($False -ne $matchedurl) {
        $url = -join("https://download.clojure.org/install/clojure-tools-",$matches["version"],".zip")
        $version = $matches["version"]
    }

    return @{
        URL        = $url
        Version    = $version
    }
}

update -ChecksumFor none