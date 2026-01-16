@echo off
REM ABOUTME: Launches Claude Code CLI for files or folders on Windows
REM          Handles both file and folder context menu launches

REM Check if Claude CLI is available
where claude >nul 2>nul
if %errorlevel% neq 0 (
    echo ERROR: Claude Code CLI not found in PATH
    echo.
    echo Please install Claude Code CLI using:
    echo   npm install -g @anthropic-ai/claude-code
    echo.
    echo Visit: https://docs.anthropic.com/en/docs/claude-code
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

if exist "%~1\" (
    REM It's a directory
    set "WORK_DIR=%~1"
    echo Starting Claude Code in folder: %~1
) else (
    REM It's a file
    set "WORK_DIR=%~dp1"
    set "FILE_ARG=%~nx1"
    echo Starting Claude Code with file: %~nx1
    echo In directory: %~dp1
)

REM Launch Claude Code with file context
where wt >nul 2>nul
if %errorlevel% equ 0 (
    REM Windows Terminal is available
    if defined FILE_ARG (
        REM Pass filename to Claude via environment variable for safety
        set "FILENAME=%FILE_ARG%"
        start "Claude Code" wt -d "%WORK_DIR%" cmd /k "claude \"Wait for my next command about %%FILENAME%%\" || (echo. & echo ERROR: Failed to start Claude Code. & echo Make sure Claude Code CLI is installed and available in PATH. & pause)"
    ) else (
        start "Claude Code" wt -d "%WORK_DIR%" cmd /k "claude || (echo. & echo ERROR: Failed to start Claude Code. & echo Make sure Claude Code CLI is installed and available in PATH. & pause)"
    )
) else (
    REM Fall back to regular Command Prompt
    if defined FILE_ARG (
        REM Pass filename to Claude via environment variable for safety
        set "FILENAME=%FILE_ARG%"
        start "Claude Code" cmd /k "cd /d ""%WORK_DIR%"" && claude \"Wait for my next command about %%FILENAME%%\" || (echo. & echo ERROR: Failed to start Claude Code. & echo Make sure Claude Code CLI is installed and available in PATH. & pause)"
    ) else (
        start "Claude Code" cmd /k "cd /d ""%WORK_DIR%"" && claude || (echo. & echo ERROR: Failed to start Claude Code. & echo Make sure Claude Code CLI is installed and available in PATH. & pause)"
    )
)