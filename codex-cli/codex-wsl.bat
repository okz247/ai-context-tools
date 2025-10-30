@echo off
setlocal enabledelayedexpansion

REM Codex CLI WSL Context Menu Launcher - Handles files and folders
REM Converts Windows paths to WSL paths and launches Codex in WSL

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

REM Determine if input is a file or folder and set appropriate path
if exist "%~1\" (
    REM It's a directory
    set "TARGET_PATH=%~1"
) else (
    REM It's a file - use parent directory
    set "TARGET_PATH=%~dp1"
    set "FILENAME=%~nx1"
)

REM Convert Windows path to WSL path
set "DRIVE_LETTER=%TARGET_PATH:~0,1%"
set "PATH_NO_DRIVE=%TARGET_PATH:~2%"
set "WSL_PATH=%PATH_NO_DRIVE:\=/%"
set "WSL_PATH=/mnt/%DRIVE_LETTER%%WSL_PATH%"

REM Convert drive letter to lowercase
for %%i in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
    if /i "%DRIVE_LETTER%"=="%%i" set "WSL_PATH=/mnt/%%i%WSL_PATH:~6%"
)

REM Launch Codex in WSL
if defined FILENAME (
    wsl.exe bash -c "cd '%WSL_PATH%' && echo 'File: %FILENAME%' && codex"
) else (
    wsl.exe bash -c "cd '%WSL_PATH%' && codex"
)
