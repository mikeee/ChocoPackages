﻿$installDir = Split-Path $MyInvocation.MyCommand.Definition
$packageVersion = '1.12.2.1571'

$uninstallArgs = @{
  packageName    = $env:ChocolateyPackageName
  zipFileName    = "clojure-tools-$packageVersion.zip"
}

Uninstall-ChocolateyZipPackage @uninstallArgs

if ($env:PSModulePath.Contains($installDir)) {
    $psModulePath = $env:PSModulePath.Replace($installDir, '').Replace(';;', ';')
    [Environment]::SetEnvironmentVariable("PSModulePath",$psModulePath,[System.EnvironmentVariableTarget]::Machine)
}
