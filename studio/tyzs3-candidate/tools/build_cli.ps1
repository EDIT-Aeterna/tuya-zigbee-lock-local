param(
    [string]$ProjectRoot = (Split-Path -Parent $PSScriptRoot),
    [int]$Jobs = 0,
    [switch]$RegenerateZap,
    [string]$MakeBin = 'C:\SiliconLabs\SimplicityStudio\v5\support\common\build\msys\1.0\bin',
    [string]$GccRoot = [Environment]::GetEnvironmentVariable('ARM_GCC_DIR', 'User')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$buildDirectory = Join-Path $ProjectRoot 'GNU ARM v12.2.1 - Default'
$makefile = Join-Path $buildDirectory 'makefile'

# A terminal opened before the user-level environment was configured does not
# see the new PATH. Make the CLI build self-contained in that case.
$pathEntries = @($env:Path -split ';' | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
$toolPaths = @($MakeBin)
if (-not [string]::IsNullOrWhiteSpace($GccRoot)) {
    $toolPaths += Join-Path $GccRoot 'bin'
}
foreach ($toolPath in $toolPaths) {
    if ((Test-Path -LiteralPath $toolPath) -and
        -not ($pathEntries | Where-Object { $_.TrimEnd('\') -ieq $toolPath.TrimEnd('\') })) {
        $pathEntries = @($toolPath) + $pathEntries
    }
}
$env:Path = $pathEntries -join ';'

$makeCommand = Get-Command make.exe -ErrorAction SilentlyContinue

if (-not $makeCommand) {
    throw 'make.exe is not on PATH. Start a new terminal after running the environment setup.'
}
if (-not (Test-Path -LiteralPath $makefile)) {
    throw "Studio-generated GNU makefile was not found: $makefile"
}

if ($RegenerateZap) {
    & (Join-Path $ProjectRoot 'tools\generate_zap.ps1') -ProjectRoot $ProjectRoot
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}

$makeArguments = @('-f', 'makefile', 'all')
if ($Jobs -gt 0) {
    $makeArguments = @("-j$Jobs") + $makeArguments
}

Push-Location -LiteralPath $buildDirectory
try {
    & $makeCommand.Source @makeArguments
    exit $LASTEXITCODE
}
finally {
    Pop-Location
}
