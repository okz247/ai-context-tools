@echo off
REM ABOUTME: Launches WSL with Claude Code CLI for files or folders
REM          Handles both file and folder context menu launches

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
if exist "%~1\" (
    REM It's a directory
    echo Starting Claude Code in folder: %~1
    start "Claude Code" wsl.exe --cd "%~1" -e bash -ic "claude 2>/dev/null || (echo 'ERROR: Claude Code CLI not found. Please install Claude Code CLI in WSL.'; echo 'Visit: https://docs.anthropic.com/en/docs/claude-code'; read -p 'Press Enter to continue...'); exec bash"
) else (
    REM It's a file - open in parent directory
    echo Starting Claude Code with file: %~nx1
    echo In directory: %~dp1
    start "Claude Code" wsl.exe --cd "%~dp1" -e bash -ic "echo 'File: %~nx1'; claude 2>/dev/null || (echo 'ERROR: Claude Code CLI not found. Please install Claude Code CLI in WSL.'; echo 'Visit: https://docs.anthropic.com/en/docs/claude-code'; read -p 'Press Enter to continue...'); exec bash"
)