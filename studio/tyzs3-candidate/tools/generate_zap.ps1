param(
    [string]$ProjectRoot = (Split-Path -Parent $PSScriptRoot),
    [string]$SdkRoot = 'C:\Users\Aerial\SimplicityStudio\SDKs\gecko_sdk',
    [string]$ZapCli = 'C:\SiliconLabs\SimplicityStudio\v5\developer\adapter_packs\zap\zap-cli.exe'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$zapFile = Join-Path $ProjectRoot 'config\zcl\zcl_config.zap'
$zclPackage = Join-Path $ProjectRoot 'config\zcl\kagel-zcl.json'
$generationTemplates = Join-Path $SdkRoot 'protocol\zigbee\app\framework\gen-template\gen-templates.json'
$outputDirectory = Join-Path $ProjectRoot 'autogen'

foreach ($requiredPath in @($zapFile, $zclPackage, $generationTemplates, $ZapCli)) {
    if (-not (Test-Path -LiteralPath $requiredPath)) {
        throw "Required ZAP input was not found: $requiredPath"
    }
}

# The explicit custom package is required because the embedded Studio package list
# otherwise falls back to the SDK sample manufacturer-specific cluster.
& $ZapCli generate --noUi --noServer --tempState --skipPostGeneration `
    --zapFile $zapFile `
    --zcl $zclPackage `
    --generationTemplate $generationTemplates `
    --packageMatch strict `
    --output $outputDirectory

if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

Write-Host "ZAP generation completed: $outputDirectory"
