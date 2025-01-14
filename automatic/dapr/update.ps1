#import-module au

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
}

function global:au_GetLatest {
    $packageName = $Latest.PackageName
    $page = Invoke-WebRequest -Uri "https://chocolatey.org/packages/$packageName.install/" -UseBasicParsing
    $regexUrl = 'packages\/'+$packageName+'.install\/(?<version>[\d.]+)\/ContactAdmins'

    $matched = $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    If ($False -ne $matched) {
        $version = $matches["version"]
    }


    return @{
        Version      = $version
    }
}

function global:au_BeforeUpdate { }

update -ChecksumFor none
