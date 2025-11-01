@echo off
REM Codex CLI Windows Context Menu Launcher - Handles files and folders

REM Validate input
if "%~1"=="" (
    echo ERROR: No path provided
    pause
    exit /b 1
)

if not exist "%~1" (
    echo ERROR: Path "%~1" does not exist
    pause
    exit /b 1
)

REM Determine if input is a file or folder
if exist "%~1\" (
    REM It's a directory
    set "TARGET_DIR=%~1"
    wt.exe -d "%TARGET_DIR%" powershell.exe -NoExit -Command "codex"
) else (
    REM It's a file - pass filename to Codex via environment variable for safety
    set "TARGET_DIR=%~dp1"
    set "FILENAME=%~nx1"
    wt.exe -d "%TARGET_DIR%" powershell.exe -NoExit -Command "codex \"Wait for my next command about $env:FILENAME\""
)
