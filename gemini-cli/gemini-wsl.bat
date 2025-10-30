@echo off
setlocal enabledelayedexpansion

REM Gemini CLI WSL Context Menu Launcher
REM Converts Windows paths to WSL paths and launches Gemini in WSL

set "FOLDER_PATH=%~1"

REM Convert Windows path to WSL path
REM Remove drive letter (C:) and convert to /mnt/c format
set "DRIVE_LETTER=%FOLDER_PATH:~0,1%"
set "PATH_NO_DRIVE=%FOLDER_PATH:~2%"

REM Convert backslashes to forward slashes
set "WSL_PATH=%PATH_NO_DRIVE:\=/%"

REM Create full WSL path
set "WSL_PATH=/mnt/%DRIVE_LETTER%%WSL_PATH%"

REM Convert drive letter to lowercase
for %%i in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
    if /i "%DRIVE_LETTER%"=="%%i" set "WSL_PATH=/mnt/%%i%WSL_PATH:~6%"
)

REM Launch Gemini in WSL
wsl.exe bash -c "cd '%WSL_PATH%' && gemini"
