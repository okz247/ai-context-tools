@echo off
REM ABOUTME: Launches Claude Code CLI directly in the selected folder on Windows
REM          Validates input and provides error handling for Claude startup

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
    echo ERROR: No folder path provided
    pause
    exit /b 1
)

REM Check if the target directory exists
if not exist "%~1" (
    echo ERROR: Directory "%~1" does not exist
    pause
    exit /b 1
)

REM Launch Claude Code in the selected folder
echo Starting Claude Code in: %~1

REM Check if Windows Terminal is available and use it, otherwise fall back to cmd
where wt >nul 2>nul
if %errorlevel% equ 0 (
    REM Windows Terminal is available
    start "Claude Code" wt -d "%~1" cmd /k claude
) else (
    REM Fall back to regular Command Prompt
    start "Claude Code" cmd /k "cd /d "%~1" && claude || (echo. && echo ERROR: Failed to start Claude Code. && echo Please check your installation. && pause)"
)