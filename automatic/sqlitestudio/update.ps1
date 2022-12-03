#import-module au

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"sqlite-studio.portable`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri "https://chocolatey.org/packages/sqlite-studio.portable/" -UseBasicParsing
    $regexUrl = 'packages\/sqlite-studio.portable\/(?<version>[\d.]+)\/ContactAdmins'

    $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    return @{
        Version      = $matches.version
    }
}

function global:au_BeforeUpdate { }

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

update -ChecksumFor none