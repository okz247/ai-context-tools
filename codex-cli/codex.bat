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
    wt.exe -d "%~1" powershell.exe -NoExit -Command "codex"
) else (
    REM It's a file - pass filename directly as a PowerShell argument
    wt.exe -d "%~dp1" powershell.exe -NoExit -Command "param([string]$fileName) codex ""Wait for my next command about $fileName""" "%~nx1"
)
