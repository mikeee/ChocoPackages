#import-module au

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).portable`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
}

function global:au_BeforeUpdate { }

function global:au_GetLatest {
    (clist hcloud.portable -e --by-id-only | select -Skip 1 | select -SkipLast 1) -match '^.+?\s+(?<version>.+?)\s+'
    
    return @{
        Version = $matches.version
    }
}

update -ChecksumFor none