#import-module au

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"wsl2-distro-manager.portable`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri "https://chocolatey.org/packages/wsl2-distro-manager.portable/" -UseBasicParsing
    $regexUrl = 'packages\/wsl2-distro-manager.portable\/(?<version>[\d.]+)\/ContactAdmins'

    $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    return @{
        Version      = $matches.version
    }
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

update -ChecksumFor none