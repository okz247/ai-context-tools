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
set "WORK_DIR="
set "FILE_NAME="
if exist "%~1\" (
    REM It's a directory
    set "WORK_DIR=%~1"
) else (
    REM It's a file - use parent directory and capture filename
    set "WORK_DIR=%~dp1"
    set "FILE_NAME=%~nx1"
)

REM Launch Codex in Windows Terminal if available, otherwise fallback
where wt >nul 2>nul
if %errorlevel% equ 0 (
    if defined FILE_NAME (
        wt.exe -d "%WORK_DIR%" powershell.exe -NoExit -Command "param([string]$fileName) codex ""Wait for my next command about $fileName""" "%FILE_NAME%"
    ) else (
        wt.exe -d "%WORK_DIR%" powershell.exe -NoExit -Command "codex"
    )
) else (
    if defined FILE_NAME (
        start "Codex" powershell.exe -NoExit -Command "param([string]$fileName) Set-Location -LiteralPath ""%WORK_DIR%""; codex ""Wait for my next command about $fileName""" "%FILE_NAME%"
    ) else (
        start "Codex" powershell.exe -NoExit -Command "Set-Location -LiteralPath ""%WORK_DIR%""; codex"
    )
)
