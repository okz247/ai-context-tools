@echo off
title Claude Code Context Menu Installer
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
set "ICON_PATH=%INSTALL_DIR%\claude.ico"
set "LAUNCHER_PATH=%INSTALL_DIR%\claude.bat"
echo  -^> Installation detected in: "%INSTALL_DIR%"
echo.

:: Command strings for context menu entries
set "COMMAND_STRING=%LAUNCHER_PATH% "%%1""
set "BG_COMMAND_STRING=%LAUNCHER_PATH% "%%V""


:: ============================================================================
:: 3. WRITE REGISTRY KEYS
:: ============================================================================
echo Adding Claude Code context menu entries to the Windows Registry...

:: Add context menu for right-clicking on a folder
REG ADD "HKEY_CLASSES_ROOT\Directory\shell\OpenWithClaudeCode" /ve /d "Open with Claude Code" /f >nul
REG ADD "HKEY_CLASSES_ROOT\Directory\shell\OpenWithClaudeCode" /v "Icon" /d "%ICON_PATH%,0" /f >nul
REG ADD "HKEY_CLASSES_ROOT\Directory\shell\OpenWithClaudeCode\command" /ve /d "%COMMAND_STRING%" /f >nul

:: Add context menu for right-clicking on the background within a folder
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\OpenWithClaudeCode" /ve /d "Open with Claude Code" /f >nul
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\OpenWithClaudeCode" /v "Icon" /d "%ICON_PATH%,0" /f >nul
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\OpenWithClaudeCode\command" /ve /d "%BG_COMMAND_STRING%" /f >nul

echo  -^> Success! Registry updated.
echo.


:: ============================================================================
:: 4. FINALIZING INSTALLATION
:: ============================================================================
echo ======================== INSTALLATION COMPLETE =======================
echo The "Open with Claude Code" context menu has been installed.
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