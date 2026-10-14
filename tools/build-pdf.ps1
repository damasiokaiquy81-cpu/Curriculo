# tools/build-pdf.ps1
#
# Regenera o PDF do curriculo a partir do index.html usando o Chrome/Edge em modo headless.
# Uso (na raiz do projeto):
#     powershell -ExecutionPolicy Bypass -File .\tools\build-pdf.ps1
# Ou informando outro destino:
#     powershell -ExecutionPolicy Bypass -File .\tools\build-pdf.ps1 -Out "C:\temp\curriculo.pdf"

param(
  [string]$Out = ""
)

$ErrorActionPreference = 'Stop'

$repo = Split-Path -Parent $PSScriptRoot
$html = Join-Path $repo 'index.html'

if (-not (Test-Path $html)) {
  Write-Error "index.html nao encontrado em $repo"
  exit 1
}

if ([string]::IsNullOrWhiteSpace($Out)) {
  $Out = Join-Path $repo 'Curriculo-Kaiquy-Damasio-Santos-Farias.pdf'
}

$candidates = @(
  (Join-Path $env:ProgramFiles 'Google\Chrome\Application\chrome.exe'),
  (Join-Path ${env:ProgramFiles(x86)} 'Google\Chrome\Application\chrome.exe'),
  (Join-Path $env:LOCALAPPDATA 'Google\Chrome\Application\chrome.exe'),
  (Join-Path ${env:ProgramFiles(x86)} 'Microsoft\Edge\Application\msedge.exe'),
  (Join-Path $env:ProgramFiles 'Microsoft\Edge\Application\msedge.exe')
) | Where-Object { $_ -and (Test-Path $_) }

$browser = $candidates | Select-Object -First 1
if (-not $browser) {
  Write-Error 'Chrome ou Edge nao encontrado. Instale um deles ou imprima o index.html pelo navegador (Ctrl+P).'
  exit 1
}

$url = 'file:///' + ($html -replace '\\', '/')

Write-Host "Navegador : $browser"
Write-Host "HTML      : $html"
Write-Host "Saida     : $Out"

& $browser --headless=new --disable-gpu --no-pdf-header-footer --virtual-time-budget=8000 --print-to-pdf="$Out" $url | Out-Null

if (Test-Path $Out) {
  $kb = [math]::Round((Get-Item $Out).Length / 1KB)
  Write-Host "OK: PDF gerado ($kb KB)" -ForegroundColor Green
} else {
  Write-Error 'Falha ao gerar o PDF.'
  exit 1
}
