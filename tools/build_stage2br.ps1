param([string]$SdkRoot='C:\Users\Aerial\SimplicityStudio\SDKs\gecko_sdk')
$ErrorActionPreference='Stop'
$project=Join-Path (Split-Path $PSScriptRoot -Parent) 'studio\tyzs5-telemetry'
$env:Path='C:\SiliconLabs\SimplicityStudio\v5\support\common\build\msys\1.0\bin;'+$env:Path
Push-Location $project
try {
    & slc generate -p kagel_tyzs5_srptwvak_clean.slcp -s $SdkRoot -o makefile --no-copy
    if ($LASTEXITCODE) { throw 'SLC generation failed' }
    & ./tools/generate_zap.ps1 -SdkRoot $SdkRoot
    if ($LASTEXITCODE) { throw 'ZAP generation failed' }
    & make -f kagel_tyzs5_srptwvak_clean.Makefile clean
    if ($LASTEXITCODE) { throw 'Clean failed' }
    & make -f kagel_tyzs5_srptwvak_clean.Makefile -j8
    if ($LASTEXITCODE) { throw 'Build failed' }
} finally { Pop-Location }
