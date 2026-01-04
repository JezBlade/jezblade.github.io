# ============================================
# BROTHERHOOD AI - Quick Start Script
# Brotherhood Seal: 015cb320
# ============================================

param(
    [switch]$EnableHooks
)

Write-Host "`n"
Write-Host "═" -NoNewline -ForegroundColor Cyan
Write-Host ("═" * 68) -ForegroundColor Cyan
Write-Host "🦅 BROTHERHOOD AI INTERCONNECTION - Quick Start" -ForegroundColor Cyan
Write-Host ("═" * 70) -ForegroundColor Cyan
Write-Host "`n"

# Handle --enable-hooks parameter
if ($EnableHooks) {
    Write-Host "🗡️ Enabling Brotherhood Pre-Commit Hooks..." -ForegroundColor Yellow
    Write-Host "`n"

    # Check if .git/hooks directory exists
    $hooksDir = ".git\hooks"
    if (-not (Test-Path $hooksDir)) {
        Write-Host "❌ Error: Git repository not initialized or hooks directory not found" -ForegroundColor Red
        exit 1
    }

    # Copy pre-commit hook
    $hookSource = ".brotherhood-pre-commit-hook.js"
    $hookDest = "$hooksDir\pre-commit"

    if (Test-Path $hookSource) {
        Copy-Item $hookSource $hookDest -Force
        Write-Host "✅ Pre-commit hook installed: $hookDest" -ForegroundColor Green

        # Make executable on Unix-like systems (if needed)
        if ($IsLinux -or $IsMacOS) {
            chmod +x $hookDest 2>&1 | Out-Null
        }

        # Log to ritual log
        $logEntry = @{
            timestamp = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ssZ")
            ritual_type = "git_hooks"
            agent = "brotherhood-ai-quickstart"
            action = "enable_pre_commit_hook"
            status = "success"
            details = @{
                hook_file = $hookDest
                repository = "MPC-Compendio-Operativo"
            }
        } | ConvertTo-Json -Compress

        Add-Content -Path "RITUAL_LOG_SYNC.jsonl" -Value $logEntry

        Write-Host "📜 Ritual logged: Pre-commit hook enabled" -ForegroundColor Gray
        Write-Host "`n"
        Write-Host "🗡️ Brotherhood Pre-Commit Hook Active!" -ForegroundColor Green
        Write-Host "   - Validates Brotherhood compliance before commits" -ForegroundColor Gray
        Write-Host "   - Blocks critical violations" -ForegroundColor Gray
        Write-Host "   - Logs all validations to RITUAL_LOG_SYNC.jsonl" -ForegroundColor Gray
        Write-Host "`n"
    } else {
        Write-Host "❌ Error: Pre-commit hook source not found: $hookSource" -ForegroundColor Red
        exit 1
    }

    exit 0
}

# Validar ubicación canónica
$canonicalRoot = "D:\Ultimate-Plan"
$workingDir = "D:\Ultimate-Plan\MPC-Compendio-Operativo"

if (-not (Test-Path $workingDir)) {
    Write-Host "❌ Error: MPC-Compendio-Operativo not found at $workingDir" -ForegroundColor Red
    exit 1
}

Set-Location $workingDir
Write-Host "📁 Working Directory: $workingDir" -ForegroundColor Green
Write-Host "`n"

# Step 1: Verificar Docker
Write-Host "─" -NoNewline -ForegroundColor DarkGray
Write-Host ("─" * 68) -ForegroundColor DarkGray
Write-Host "📦 STEP 1: Docker Services Check" -ForegroundColor Yellow
Write-Host "─" -NoNewline -ForegroundColor DarkGray
Write-Host ("─" * 68) -ForegroundColor DarkGray
Write-Host "`n"

try {
    docker --version | Out-Null
    Write-Host "✅ Docker is installed" -ForegroundColor Green
} catch {
    Write-Host "❌ Docker not found. Please install Docker first." -ForegroundColor Red
    exit 1
}

Write-Host "   Starting Redis, PostgreSQL, Qdrant, Neo4j..." -ForegroundColor Gray
docker-compose up -d redis postgres qdrant neo4j 2>&1 | Out-Null

Start-Sleep -Seconds 3

$services = @('redis', 'postgres', 'qdrant', 'neo4j')
foreach ($service in $services) {
    $status = docker-compose ps $service --format "{{.Status}}" 2>&1
    if ($status -match "Up") {
        Write-Host "   ✓ $service running" -ForegroundColor Green
    } else {
        Write-Host "   ⚠️  $service not running (optional)" -ForegroundColor Yellow
    }
}

Write-Host "`n"

# Step 2: Verificar Node.js
Write-Host "─" -NoNewline -ForegroundColor DarkGray
Write-Host ("─" * 68) -ForegroundColor DarkGray
Write-Host "🟢 STEP 2: Node.js Check" -ForegroundColor Yellow
Write-Host "─" -NoNewline -ForegroundColor DarkGray
Write-Host ("─" * 68) -ForegroundColor DarkGray
Write-Host "`n"

$nodeExe = "D:\Ultimate-Plan\Program-Files\nodejs\node.exe"
if (Test-Path $nodeExe) {
    $nodeVersion = & $nodeExe --version
    Write-Host "✅ Node.js canonical: $nodeVersion" -ForegroundColor Green
} else {
    Write-Host "⚠️  Canonical Node.js not found, using system Node..." -ForegroundColor Yellow
    try {
        $nodeVersion = node --version
        Write-Host "   System Node.js: $nodeVersion" -ForegroundColor Gray
    } catch {
        Write-Host "❌ Node.js not found. Please install Node.js first." -ForegroundColor Red
        exit 1
    }
}

Write-Host "`n"

# Step 3: Instalar dependencias
Write-Host "─" -NoNewline -ForegroundColor DarkGray
Write-Host ("─" * 68) -ForegroundColor DarkGray
Write-Host "📦 STEP 3: NPM Dependencies" -ForegroundColor Yellow
Write-Host "─" -NoNewline -ForegroundColor DarkGray
Write-Host ("─" * 68) -ForegroundColor DarkGray
Write-Host "`n"

if (-not (Test-Path "node_modules")) {
    Write-Host "   Installing npm packages..." -ForegroundColor Gray
    npm install redis @qdrant/js-client-rest neo4j-driver pg 2>&1 | Out-Null
    Write-Host "✅ Dependencies installed" -ForegroundColor Green
} else {
    Write-Host "✅ Dependencies already installed" -ForegroundColor Green
}

Write-Host "`n"

# Step 4: Ejecutar setup
Write-Host "─" -NoNewline -ForegroundColor DarkGray
Write-Host ("─" * 68) -ForegroundColor DarkGray
Write-Host "🚀 STEP 4: Brotherhood AI Setup" -ForegroundColor Yellow
Write-Host "─" -NoNewline -ForegroundColor DarkGray
Write-Host ("─" * 68) -ForegroundColor DarkGray
Write-Host "`n"

Write-Host "Would you like to run the full Brotherhood AI setup now? (Y/N)" -ForegroundColor Cyan
$response = Read-Host

if ($response -eq 'Y' -or $response -eq 'y') {
    Write-Host "`n"
    Write-Host "🦅 Launching Brotherhood AI Main Orchestrator..." -ForegroundColor Green
    Write-Host "`n"
    node brotherhood-ai-main.js
} else {
    Write-Host "`n"
    Write-Host "═" -NoNewline -ForegroundColor Cyan
    Write-Host ("═" * 68) -ForegroundColor Cyan
    Write-Host "📋 Manual Commands" -ForegroundColor Cyan
    Write-Host ("═" * 70) -ForegroundColor Cyan
    Write-Host "`n"
    Write-Host "Run setup manually:" -ForegroundColor Yellow
    Write-Host "   cd D:\Ultimate-Plan\MPC-Compendio-Operativo" -ForegroundColor Gray
    Write-Host "   node brotherhood-ai-main.js" -ForegroundColor Gray
    Write-Host "`n"
    Write-Host "Or run individual scripts:" -ForegroundColor Yellow
    Write-Host "   node scripts/setup-redis.js" -ForegroundColor Gray
    Write-Host "   node scripts/setup-databases.js" -ForegroundColor Gray
    Write-Host "   node scripts/test-communication.js" -ForegroundColor Gray
    Write-Host "`n"
}

Write-Host "═" -NoNewline -ForegroundColor Cyan
Write-Host ("═" * 68) -ForegroundColor Cyan
Write-Host "✅ Quick Start Complete" -ForegroundColor Green
Write-Host ("═" * 70) -ForegroundColor Cyan
Write-Host "`n"
