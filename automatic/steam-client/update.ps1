#import-module au

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"steam`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri "https://chocolatey.org/packages/steam/" -UseBasicParsing
    $regexUrl = 'packages\/steam\/(?<version>[\d.]+)\/ContactAdmins'

    $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    return @{
        Version      = $matches.version
    }
}

function global:au_BeforeUpdate { }

update -ChecksumFor none