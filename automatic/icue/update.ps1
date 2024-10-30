#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://www.corsair.com/uk/en/s/downloads'
$releaseUrl  = 'https://www3.corsair.com/software/CUE_V5/public/modules/windows/installer/Install%20iCUE.exe'

$checksumType = 'SHA256' 

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'              = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType)'"
        }
    }
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $tempFile = New-TemporaryFile
    Invoke-WebRequest -Uri $releaseUrl -OutFile $tempFile -UseBasicParsing

    $checksum = Get-FileHash -Algorithm $checksumType -Path $tempFile -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Hash

    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246"
    $regexVersion = 'CORSAIR iCUE v(?<version>[\d\.]+) with iCUE Murals'

    $matched = $page.Content -match $regexVersion


    return @{
        URL          = $releaseUrl
	Checksum     = $checksum
        ChecksumType = $checksumType
        Version      = $matches.version
    }
}

update -ChecksumFor none
