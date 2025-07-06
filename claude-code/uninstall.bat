@echo off
title Claude Code Context Menu Uninstaller
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
    echo Please right-click on "uninstall.bat" and select
    echo "Run as administrator".
    echo ================================================================
    echo.
    pause
    exit /b
)
echo  -> Success! Administrator rights confirmed.
echo.


:: ============================================================================
:: 2. DELETE REGISTRY KEYS
:: ============================================================================
echo Removing Claude Code context menu entries from the Windows Registry...
REG DELETE "HKEY_CLASSES_ROOT\Directory\shell\OpenWithClaudeCode" /f >nul
REG DELETE "HKEY_CLASSES_ROOT\Directory\Background\shell\OpenWithClaudeCode" /f >nul
echo  -> Success! Registry entries have been removed.
echo.


:: ============================================================================
:: 3. FINALIZING UNINSTALLATION
:: ============================================================================
echo ====================== UNINSTALLATION COMPLETE =====================
echo The "Open with Claude Code" context menu has been removed.
echo.
echo For the change to take full effect, the Windows Explorer process
echo can be restarted.
echo.
choice /c YN /m "Do you want to restart Explorer now?"
if %errorlevel% equ 1 (
    echo Restarting Explorer...
    taskkill /f /im explorer.exe >nul
    start explorer.exe
)
echo.
echo You can now safely delete this folder.
echo.
pause