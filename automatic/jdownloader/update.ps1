$ErrorActionPreference = 'Stop'
Import-Module -Name 'au'

function global:au_SearchReplace {
    @{
        '.\tools\VERIFICATION.txt' = @{
            '(?i)(\s+url:).*'        = "`${1} $($Latest.URL)"
            '(?i)(\s+checksum64:).*' = "`${1} $($Latest.Checksum64)"
        }
    }
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {

    $DownloadsPage = Invoke-WebRequest -UseBasicParsing -Uri 'https://jdownloader.org/jdownloader2'
    $MegaLink = ($DownloadsPage.Links | Where-Object -Property 'href' -Match 'https://mega.nz/file/')[0]

    $InstallerPath = '.\tools\JDownloader2Setup.exe'
    $TempPath = $InstallerPath + '.tmp'
    megatools dl --no-progress --path="$TempPath" $MegaLink.href
    Move-Item -Path $TempPath -Destination $InstallerPath -Force
    $latestVersion = (Get-Item $InstallerPath).VersionInfo.ProductVersion
    $latestChecksum64 = (Get-FileHash -Path $InstallerPath -Algorithm 'SHA256').Hash

    return @{
        URL        = $MegaLink.href
        Version    = $latestVersion
        Checksum64 = $latestChecksum64
    }
}

update -ChecksumFor none