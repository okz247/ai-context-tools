@echo off
REM ABOUTME: Launches Claude Code - Openrouter (claude-or) for files or folders on Windows
REM          Handles both file and folder context menu launches

REM Prefer PowerShell so user-defined claude-or works
set "PWSH_EXE="
where pwsh >nul 2>nul
if %errorlevel% equ 0 (
    set "PWSH_EXE=pwsh"
) else (
    set "PWSH_EXE=powershell"
)

REM Check if claude-or command is available (PATH or PowerShell profile)
set "CLAUDE_OR_FOUND="
for /f "delims=" %%A in ('where claude-or 2^>nul') do (
    set "CLAUDE_OR_FOUND=1"
)
if not defined CLAUDE_OR_FOUND (
    %PWSH_EXE% -Command "if (Test-Path $PROFILE) { . $PROFILE }; if (Get-Command claude-or -ErrorAction SilentlyContinue) { exit 0 } else { exit 1 }"
    if %errorlevel% equ 0 (
        set "CLAUDE_OR_FOUND=1"
    )
)
if not defined CLAUDE_OR_FOUND (
    echo ERROR: claude-or command not found
    echo.
    echo Fix: open PowerShell and run: claude-or --version
    echo If that works, restart Windows Explorer and try again.
    echo If it fails, add claude-or to your PowerShell profile and reload it.
    echo.
    pause
    exit /b 1
)

REM Validate input parameter
if "%~1"=="" (
    echo ERROR: No path provided
    pause
    exit /b 1
)

REM Check if the target exists
if not exist "%~1" (
    echo ERROR: Path "%~1" does not exist
    pause
    exit /b 1
)

REM Determine if input is a file or folder
set "TARGET_PATH=%~1"
set "WORK_DIR="
set "FILE_ARG="
set "FILENAME="

if exist "%~1\" (
    REM It's a directory
    set "WORK_DIR=%~1"
    echo Starting Claude Code - Openrouter in folder: %~1
) else (
    REM It's a file
    set "WORK_DIR=%~dp1"
    set "FILE_ARG=%~nx1"
    echo Starting Claude Code - Openrouter with file: %~nx1
    echo In directory: %~dp1
)

REM Pass filename to Claude via environment variable for safety
if defined FILE_ARG (
    set "FILENAME=%FILE_ARG%"
)

REM Export values to PowerShell via env vars (avoid brittle quoting of Windows paths)
set "CLAUDE_OR_WORK_DIR=%WORK_DIR%"
set "CLAUDE_OR_FILENAME=%FILE_ARG%"

REM Avoid -Command quoting issues by generating a temporary .ps1 script and running it with -File.
set "PS_SCRIPT=%TEMP%\ai-context-tools-claude-or-%RANDOM%%RANDOM%.ps1"
(
echo if ^(Test-Path $PROFILE^) { . $PROFILE }
echo Set-Location -LiteralPath $env:CLAUDE_OR_WORK_DIR
echo if ^($env:CLAUDE_OR_FILENAME^) { claude-or ^('Wait for my next command about ' + $env:CLAUDE_OR_FILENAME^) } else { claude-or }
) > "%PS_SCRIPT%"

REM Launch Claude Code - Openrouter with file context (PowerShell)
where wt >nul 2>nul
if %errorlevel% equ 0 (
    REM Windows Terminal is available
    REM Use "--" so wt stops parsing args and passes them to PowerShell reliably
    start "Claude Code - Openrouter" wt -d "%WORK_DIR%" -- %PWSH_EXE% -NoExit -ExecutionPolicy Bypass -File "%PS_SCRIPT%"
) else (
    REM Fall back to regular PowerShell window
    start "Claude Code - Openrouter" "%PWSH_EXE%" -NoExit -ExecutionPolicy Bypass -File "%PS_SCRIPT%"
)
