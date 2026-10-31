#import-module au

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"sqlite-studio.install`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri "https://chocolatey.org/packages/sqlite-studio.install/" -UseBasicParsing
    $regexUrl = 'packages\/sqlite-studio.install\/(?<version>[\d.]+)\/ContactAdmins'

    $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    return @{
        Version      = $matches.version
    }
}

function global:au_BeforeUpdate { }

update -ChecksumFor none