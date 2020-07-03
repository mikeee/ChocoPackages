$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//civo/cli/releases/download/v0.6.8/civo-0.6.8-windows-386.zip'
    checksum       = '326546d052e1eddbb3bc372914bbf73cd0533f885954cc823dfc953e14b789d7'
    checksumType   = 'SHA256'

    url64          = 'https://github.com//civo/cli/releases/download/v0.6.8/civo-0.6.8-windows-amd64.zip'
    checksum64     = '02dbfd5331ca03ea4647750b82aed84edc0a3dd1054b8912a2df7473ef071a37'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
