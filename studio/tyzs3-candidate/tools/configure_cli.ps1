param(
    [string]$SdkRoot = 'C:\Users\Aerial\SimplicityStudio\SDKs\gecko_sdk',
    [string]$SlcRoot = 'C:\Users\Aerial\.silabs\slc_cli_windows\slc_cli',
    [string]$GccRoot = 'C:\SiliconLabs\SimplicityStudio\v5\developer\toolchains\gnu_arm\12.2.rel1_2023.7',
    [string]$MakeBin = 'C:\SiliconLabs\SimplicityStudio\v5\support\common\build\msys\1.0\bin',
    [string]$JavaHome = 'C:\Program Files\Eclipse Adoptium\jdk-21.0.6.7-hotspot',
    [switch]$TrustSdk
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$slcBat = Join-Path $SlcRoot 'slc.bat'
$gccBin = Join-Path $GccRoot 'bin'
$javaBin = Join-Path $JavaHome 'bin'

foreach ($requiredPath in @($SdkRoot, $slcBat, $gccBin, $MakeBin, $javaBin)) {
    if (-not (Test-Path -LiteralPath $requiredPath)) {
        throw "Required CLI path was not found: $requiredPath"
    }
}

$persistentEntries = @($SlcRoot, $gccBin, $MakeBin, $javaBin)
$userPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$pathEntries = @()
if (-not [string]::IsNullOrWhiteSpace($userPath)) {
    $pathEntries = @($userPath -split ';' | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
}
foreach ($entry in $persistentEntries) {
    if (-not ($pathEntries | Where-Object { $_.TrimEnd('\') -ieq $entry.TrimEnd('\') })) {
        $pathEntries += $entry
    }
}
$newUserPath = $pathEntries -join ';'
if ($newUserPath -cne $userPath) {
    [Environment]::SetEnvironmentVariable('Path', $newUserPath, 'User')
}

function Set-UserEnvironmentValue {
    param(
        [string]$Name,
        [string]$Value
    )
    if ([Environment]::GetEnvironmentVariable($Name, 'User') -cne $Value) {
        [Environment]::SetEnvironmentVariable($Name, $Value, 'User')
    }
}

Set-UserEnvironmentValue 'GSDK_ROOT' $SdkRoot
Set-UserEnvironmentValue 'SLC_CLI_ROOT' $SlcRoot
Set-UserEnvironmentValue 'ARM_GCC_DIR' $GccRoot
Set-UserEnvironmentValue 'JAVA_HOME' $JavaHome

# Make the current PowerShell process usable immediately; new terminals inherit
# the persistent user-level values above.
$env:GSDK_ROOT = $SdkRoot
$env:SLC_CLI_ROOT = $SlcRoot
$env:ARM_GCC_DIR = $GccRoot
$env:JAVA_HOME = $JavaHome
$env:Path = (($persistentEntries + @($env:Path -split ';')) -join ';')

& $slcBat --ignore-slt --noColor configuration --sdk $SdkRoot
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

# SS5 SLC records the SDK path in its legacy CLI configuration. The compiler
# path is also exported persistently because this SLC release does not retain
# the -gcc value in that file.
& $slcBat --ignore-slt --noColor configuration "-gcc=$GccRoot"
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

if ($TrustSdk) {
    & $slcBat --ignore-slt --noColor signature trust --sdk $SdkRoot
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}

Write-Host "CLI environment configured for:"
Write-Host "  SDK:       $SdkRoot"
Write-Host "  SLC-CLI:   $SlcRoot"
Write-Host "  GCC:       $GccRoot"
Write-Host "  make:      $MakeBin"
Write-Host "  Java:      $JavaHome"
