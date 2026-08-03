#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1
. (Join-Path $PSScriptRoot 'tools\Get-MsiAfterburnerDownloadUrl.ps1')

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(?i)(^\s*\$checksum\s*=\s*)(''.*'')'       = "`$1'$($Latest.Checksum)'"
            '(?i)(^\s*\$checksumType\s*=\s*)(''.*'')'   = "`$1'$($Latest.ChecksumType)'"
        }
    }
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $url = Get-MsiAfterburnerDownloadUrl
    $tempFile = New-TemporaryFile
    $archive = $null

    try {
        Invoke-WebRequest -Uri $url -OutFile $tempFile -UseBasicParsing
        $checksum = Get-FileHash -Algorithm SHA256 -Path $tempFile | Select-Object -ExpandProperty Hash

        if ($PSVersionTable.PSVersion.Major -lt 6) {
            Add-Type -AssemblyName System.IO.Compression.FileSystem
        }

        $archive = [System.IO.Compression.ZipFile]::OpenRead($tempFile)
        $installerPattern = '^MSIAfterburner(?:Setup|Installer)(?<major>\d)(?<minor>\d)(?<patch>\d+).*\.exe$'
        $installerEntries = @($archive.Entries | Where-Object { $_.Name -match $installerPattern })

        if ($installerEntries.Count -ne 1) {
            throw "MSI archive contained $($installerEntries.Count) matching installers; expected exactly one"
        }

        $installerEntry = $installerEntries[0]
        $versionMatch = [regex]::Match($installerEntry.Name, $installerPattern)
        $baseVersion = '{0}.{1}.{2}' -f $versionMatch.Groups['major'].Value,
            $versionMatch.Groups['minor'].Value, $versionMatch.Groups['patch'].Value
        $versionDate = $installerEntry.LastWriteTime.ToString('yyMMdd')
        $version = '{0}.{1}' -f $baseVersion, $versionDate

        return @{
            URL          = $url
            Checksum     = $checksum
            ChecksumType = 'SHA256'
            Version      = $version
        }
    } finally {
        if ($null -ne $archive) {
            $archive.Dispose()
        }
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force
        }
    }
}

update -ChecksumFor none