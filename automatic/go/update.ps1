#import-module au

function global:au_SearchReplace {
    @{
        "go.nuspec" = @{
            "(\<dependency .+?`"golang`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
}

function global:au_BeforeUpdate { }

function global:au_GetLatest {
    $packageName = "golang"
    $page = Invoke-WebRequest -Uri "https://chocolatey.org/packages/$packageName/" -UseBasicParsing
    $regexUrl = 'packages\/'+$packageName+'\/(?<version>[\d.]+)\/ContactAdmins'

    $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    return @{
        Version      = $matches.version
    }
}

update -ChecksumFor none