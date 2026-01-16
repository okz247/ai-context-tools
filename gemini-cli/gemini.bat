@echo off
REM ABOUTME: Launches Gemini CLI for files or folders on Windows
REM          Handles both file and folder context menu launches

REM Check if Gemini CLI is available
where gemini >nul 2>nul
if %errorlevel% neq 0 (
    echo ERROR: Gemini CLI not found in PATH
    echo.
    echo Please install Gemini CLI, then try again.
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

REM Determine working directory (folder itself, or parent folder for a file)
set "WORK_DIR="
if exist "%~1\" (
    REM It's a directory
    set "WORK_DIR=%~1"
) else (
    REM It's a file
    set "WORK_DIR=%~dp1"
)

REM Launch Gemini in a new terminal window, in the chosen directory
where wt >nul 2>nul
if %errorlevel% equ 0 (
    start "Gemini CLI" wt -d "%WORK_DIR%" powershell.exe -NoExit -Command "gemini"
) else (
    start "Gemini CLI" powershell.exe -NoExit -Command "Set-Location -LiteralPath ""%WORK_DIR%""; gemini"
)

