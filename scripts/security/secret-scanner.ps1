# Brotherhood Seal: 015cb320
# SECRET SCANNER - jezblade.github.io

param([switch]$Staged)

$RepoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)

$Patterns = @{
    "API Key Inline" = '(?i)api[_-]?key.*[=:]\s*[''"][a-zA-Z0-9_-]{20,}[''"]'
    "GitHub" = 'gh[ps]_[a-zA-Z0-9]{36}'
    "Google Analytics" = 'UA-\d{6,}-\d'
    "Firebase" = '(?i)firebase.*[=:]\s*[a-zA-Z0-9_-]{30,}'
}

Write-Host "`n🛡️ SECRET SCANNER - jezblade.github.io" -ForegroundColor Cyan

Push-Location $RepoRoot
$files = if ($Staged) { git diff --cached --name-only 2>$null } else { git ls-files 2>$null }
Pop-Location

$files = $files | Where-Object { $_ -match '\.(html|js|json|yml|yaml|css)$' }

$found = 0
foreach ($file in $files) {
    $path = Join-Path $RepoRoot $file
    if (-not (Test-Path $path)) { continue }

    $content = Get-Content $path -Raw -ErrorAction SilentlyContinue
    if ($content -match '__[A-Z_]+__') { continue }

    foreach ($p in $Patterns.GetEnumerator()) {
        if ($content -match $p.Value) {
            Write-Host "🚨 $file : $($p.Key)" -ForegroundColor Red
            $found++
        }
    }
}

if ($found -gt 0) { exit 1 }
Write-Host "✅ Zero Exposure: COMPLIANT" -ForegroundColor Green
exit 0
