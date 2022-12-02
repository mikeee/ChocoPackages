#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://marketplace.visualstudio.com/items?itemName=golang.go-nightly'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(golang.go-nightly@)[^']*" = "`${1}$($Latest.Version)"
        }
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"vscode`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.VsCodeVersion)`""
        }
    }
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    if ($download_page.Content -match 'assetUri":"([^"]+)') {
        $assetUri = $Matches[1]
    }
    else {
        throw "Unable to grab asset uri file"
    }

    $json = Invoke-RestMethod -UseBasicParsing -Uri "$assetUri/Microsoft.VisualStudio.Code.Manifest"

    @{
        Version       = $json.version
        RemoteVersion = $json.version
        VsCodeVersion = $json.engines.vscode.TrimStart('^')
    }
}

update -ChecksumFor none