param(
    [Parameter(Mandatory=$true)][ValidateSet('TYZS5','TYZS3')][string]$Module,
    [Parameter(Mandatory=$true)][ValidateSet('Control','Monitor')][string]$Edition,
    [string]$SdkRoot='C:\Users\Aerial\SimplicityStudio\SDKs\gecko_sdk'
)
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
& python (Join-Path $PSScriptRoot 'build_access_variant.py') --module $Module --edition $Edition --sdk $SdkRoot
if($LASTEXITCODE){throw "$Module $Edition build failed"}
