@echo off
REM ABOUTME: Launches WSL in the selected folder and starts Claude Code CLI
REM          Validates input and provides error handling for WSL/Claude startup

REM Check if WSL is available
where wsl.exe >nul 2>nul
if %errorlevel% neq 0 (
    echo ERROR: WSL is not installed or not in PATH
    echo Please install WSL from Microsoft Store or Windows Features
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

REM Launch WSL in the selected folder and start Claude, then keep the shell open
echo Starting Claude Code in: %~1
start "Claude Code" wsl.exe --cd "%~1" -e bash -ic "claude 2>/dev/null || (echo 'ERROR: Claude Code CLI not found. Please install Claude Code CLI in WSL.'; echo 'Visit: https://docs.anthropic.com/en/docs/claude-code'; read -p 'Press Enter to continue...'); exec bash"