# Clona repos OneRF como pastas irmãs e abre o workspace Cursor.
# Uso: powershell -ExecutionPolicy Bypass -File .\scripts\clone-workspace.ps1
#      powershell -ExecutionPolicy Bypass -File .\scripts\clone-workspace.ps1 -TargetDir C:\git_onerf

param(
    [string]$TargetDir = (Join-Path (Split-Path $PSScriptRoot -Parent) '..')
)

$TargetDir = (Join-Path (Split-Path $PSScriptRoot -Parent) '..')
}

try {
    $TargetDir = (Resolve-Path -LiteralPath $TargetDir).Path
} catch {

$org = 'OneRF-Networks'
$repos = @(
    'onerf-platform-docs',
    'backend',
    'b2b_analytics',
    'AppHub',
    'KlabinDash',
    'SinterDash',
    'SolarDash'
)

New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Push-Location $TargetDir

foreach ($repo in $repos) {
    $dest = Join-Path $TargetDir $repo
    if (Test-Path (Join-Path $dest '.git')) {
        Write-Host "OK (exists): $repo"
        continue
    }
    Write-Host "Cloning: $repo ..."
    git clone "https://github.com/$org/$repo.git" $dest
    if ($LASTEXITCODE -ne 0) { Write-Warning "Failed: $repo" }
}

Pop-Location

$workspace = Join-Path $TargetDir 'onerf-platform-docs\onerf.code-workspace'
Write-Host ""
Write-Host "Done. Open in Cursor:"
Write-Host "  $workspace"
Write-Host ""
Write-Host "File -> Open Workspace from File... -> onerf.code-workspace"
