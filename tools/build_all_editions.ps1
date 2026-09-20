param([string]$SdkRoot='C:\Users\Aerial\SimplicityStudio\SDKs\gecko_sdk')
$ErrorActionPreference='Stop'
foreach($moduleTarget in @('TYZS5','TYZS3')) {
    foreach($editionName in @('Control','Monitor')) {
        & (Join-Path $PSScriptRoot 'build_tzll.ps1') -Module $moduleTarget -Edition $editionName -SdkRoot $SdkRoot
    }
}
