#import-module au

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"sparkmail.install`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri "https://chocolatey.org/packages/sparkmail.install/" -UseBasicParsing
    $regexUrl = 'packages\/sparkmail.install\/(?<version>[\d.]+)\/ContactAdmins'

    $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    return @{
        Version      = $matches.version
    }
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

update -ChecksumFor none