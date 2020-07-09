#import-module au

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"sqlite-studio.portable`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
}

function global:au_BeforeUpdate { }

function global:au_GetLatest {
    (clist sqlite-studio.portable -e --by-id-only | Select-Object -Skip 1 | Select-Object -SkipLast 1) -match '(?<version>[\d.]+) \[Approved]'
    
    return @{
        Version = $matches.version
    }
}

update -ChecksumFor none