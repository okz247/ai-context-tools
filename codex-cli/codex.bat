@echo off
REM Codex CLI Windows Context Menu Launcher

REM Get the folder path passed from the context menu
set "FOLDER_PATH=%~1"

REM Launch Windows Terminal with PowerShell in the selected folder
wt.exe -d "%FOLDER_PATH%" powershell.exe -NoExit -Command "codex"
