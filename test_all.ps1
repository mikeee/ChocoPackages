#Name can be 'random N' to randomly force the Nth group of packages.

param( [string[]] $Name, [string] $Root = "$PSScriptRoot\automatic" )

if (Test-Path $PSScriptRoot/update_vars.ps1) { . $PSScriptRoot/update_vars.ps1 }
$global:au_root = Resolve-Path $Root

if (($Name.Length -gt 0) -and ($Name[0] -match '^random (.+)')) {
    [array] $lsau = lsau

    $group = [int]$Matches[1]
    $n = (Get-Random -Maximum $group)
    Write-Host "TESTING GROUP $($n+1) of $group"

    $group_size = [int]($lsau.Count / $group) + 1
    $Name = $lsau | Select-Object -First $group_size -Skip ($group_size * $n) | ForEach-Object { $_.Name }

    Write-Host ($Name -join ' ')
    Write-Host ('-' * 80)
}

$options = [ordered]@{
    Force           = $true
    Push            = $false
    Timeout         = 100                                     #Connection timeout in seconds
    UpdateTimeout   = 1200                                    #Update timeout in seconds
    Threads         = 10                                      #Number of background jobs to use
    IgnoreOn      = @(                                      #Error message parts to set the package ignore status
      'Origin Time-out'
      'Could not create SSL/TLS secure channel'
      'Could not establish trust relationship'
      'The operation has timed out'
      'Internal Server Error'
      'Service Temporarily Unavailable'
      'the package version already exists on the repository'
      'already exists on a Simple OData Server'             # https://github.com/chocolatey/chocolatey.org/issues/613
      'Conflict'
      'OutOfMemoryException'
    )
    RepeatOn      = @(                                      #Error message parts on which to repeat package updater
      'Could not create SSL/TLS secure channel'             # https://github.com/chocolatey/chocolatey-coreteampackages/issues/718
      'Could not establish trust relationship'              # -||-
      'Unable to connect'
      'The remote name could not be resolved'
      'Choco pack failed with exit code 1'                  # https://github.com/chocolatey/chocolatey-coreteampackages/issues/721
      'The operation has timed out'
      'Internal Server Error'
      'An exception occurred during a WebClient request'
      'remote session failed with an unexpected state'
      'the package version already exists on the repository'
      'already exists on a Simple OData Server'             # https://github.com/chocolatey/chocolatey.org/issues/613
      'Conflict'
      'Job returned no object'
    )

    Report = @{
        Type   = 'markdown'                                   #Report type: markdown or text
        Path   = "$PSScriptRoot\Update-Force-Test-${n}.md"      #Path where to save the report
        Params = @{                                          #Report parameters:
            Github_UserRepo = $Env:github_user_repo         #  Markdown: shows user info in upper right corner
            NoAppVeyor      = $false                            #  Markdown: do not show AppVeyor build shield
            Title           = "Update Force Test - Group ${n}"
            UserMessage     = "[Update report](https://gist.github.com/$Env:gist_id) | **USING AU NEXT VERSION**"       #  Markdown, Text: Custom user message to show
        }
    }

    Gist   = @{
        Id          = $Env:gist_id_test                          #Your gist id; leave empty for new private or anonymous gist
        ApiKey      = $Env:github_api_key                        #Your github api key - if empty anoymous gist is created
        Path        = "$PSScriptRoot\Update-Force-Test-${n}.md"       #List of files to add to the gist
        Description = "Update Force Test Report #powershell #chocolatey"
    }
}


$global:info = updateall -Name $Name -Options $Options
