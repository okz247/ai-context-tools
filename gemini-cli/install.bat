@echo off
title Gemini CLI Context Menu Installer (PowerShell Edition)
cls

:: ============================================================================
:: 1. VERIFY ADMINISTRATOR PRIVILEGES
:: ============================================================================
echo Verifying administrator privileges...
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo.
    echo ============================ ERROR =============================
    echo This script requires administrator privileges to modify the
    echo Windows Registry.
    echo.
    echo Please right-click on "install.bat" and select
    echo "Run as administrator".
    echo ================================================================
    echo.
    pause
    exit /b
)
echo  -^> Success! Administrator rights confirmed.
echo.


:: ============================================================================
:: 2. SET UP INSTALLATION PATHS AND COMMANDS
:: ============================================================================
echo Setting up installation paths...
cd /d "%~dp0"
set "INSTALL_DIR=%~dp0"
set "INSTALL_DIR=%INSTALL_DIR:~0,-1%"
set "ICON_PATH=%INSTALL_DIR%\gemini.ico"
echo  -^> Installation detected in: "%INSTALL_DIR%"
echo.

:: This command uses cmd.exe to correctly expand the path variables (%1 and %V)
:: before passing them to PowerShell. This is the definitive fix.
set "COMMAND_STRING=cmd.exe /c \"powershell.exe -NoExit -Command \"\"Set-Location -LiteralPath '%%%%1'; gemini\"\"\""
set "BG_COMMAND_STRING=cmd.exe /c \"powershell.exe -NoExit -Command \"\"Set-Location -LiteralPath '%%V'; gemini\"\"\""


:: ============================================================================
:: 3. WRITE REGISTRY KEYS
:: ============================================================================
echo Adding PowerShell context menu entries to the Windows Registry...

:: Add context menu for right-clicking on a folder
REG ADD "HKEY_CLASSES_ROOT\Directory\shell\OpenInGeminiCLI" /ve /d "Open in Gemini CLI" /f >nul
REG ADD "HKEY_CLASSES_ROOT\Directory\shell\OpenInGeminiCLI" /v "Icon" /d "%ICON_PATH%,0" /f >nul
REG ADD "HKEY_CLASSES_ROOT\Directory\shell\OpenInGeminiCLI\command" /ve /d "%COMMAND_STRING%" /f >nul

:: Add context menu for right-clicking on the background within a folder
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\OpenInGeminiCLI" /ve /d "Open in Gemini CLI" /f >nul
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\OpenInGeminiCLI" /v "Icon" /d "%ICON_PATH%,0" /f >nul
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\OpenInGeminiCLI\command" /ve /d "%BG_COMMAND_STRING%" /f >nul

echo  -^> Success! Registry updated.
echo.


:: ============================================================================
:: 4. FINALIZING INSTALLATION
:: ============================================================================
echo ======================== INSTALLATION COMPLETE =======================
echo The "Open in Gemini CLI" context menu has been installed.
echo.
echo For the change to take effect, the Windows Explorer process
echo must be restarted.
echo.
choice /c YN /m "Do you want to restart Explorer now?"
if %errorlevel% equ 1 (
    echo Restarting Explorer...
    taskkill /f /im explorer.exe >nul
    start explorer.exe
)
echo.
echo Installation successful. Happy Coding!
echo.
pause