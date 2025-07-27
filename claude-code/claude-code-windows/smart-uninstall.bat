@echo off
REM Smart uninstaller for Claude Code context menu integration
REM Can be run from anywhere to remove Claude Code installation

echo ===============================================
echo  Claude Code Context Menu - Smart Uninstaller
echo ===============================================
echo.

REM Define expected installation directory
set "INSTALL_DIR=%LOCALAPPDATA%\ai-context-menu-tools\claude"

REM Check if running as administrator
net session >nul 2>&1
if %errorlevel% equ 0 (
    set "IS_ADMIN=1"
    echo Running with administrator privileges.
) else (
    set "IS_ADMIN=0"
    echo Running without administrator privileges.
)
echo.

REM Remove user-level registry entries (no admin required)
echo Removing user-level registry entries...
reg delete "HKEY_CURRENT_USER\Software\Classes\Directory\shell\OpenWithClaudeCode" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\OpenWithClaudeCode" /f >nul 2>&1
echo User-level registry entries removed.

REM Check for and remove admin-level registry entries if admin
if "%IS_ADMIN%"=="1" (
    echo.
    echo Checking for admin-level registry entries...
    reg query "HKEY_CLASSES_ROOT\Directory\shell\OpenWithClaudeCode" >nul 2>&1
    if %errorlevel% equ 0 (
        echo Found admin-level entries. Removing...
        reg delete "HKEY_CLASSES_ROOT\Directory\shell\OpenWithClaudeCode" /f >nul 2>&1
        reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\OpenWithClaudeCode" /f >nul 2>&1
        echo Admin-level registry entries removed.
    ) else (
        echo No admin-level entries found.
    )
) else (
    echo.
    echo Checking for admin-level registry entries...
    reg query "HKEY_CLASSES_ROOT\Directory\shell\OpenWithClaudeCode" >nul 2>&1
    if %errorlevel% equ 0 (
        echo WARNING: Admin-level registry entries exist but cannot be removed.
        echo To remove them, run this script as administrator.
    ) else (
        echo No admin-level entries found.
    )
)

REM Check for installation directory
echo.
echo Checking for installation files...
if exist "%INSTALL_DIR%" (
    echo Found installation at: %INSTALL_DIR%
    echo.
    echo Files in installation directory:
    dir /b "%INSTALL_DIR%"
    echo.
    
    echo Would you like to delete the installation directory?
    echo WARNING: This will permanently delete all Claude Code files.
    echo.
    choice /C YN /M "Delete installation directory"
    if errorlevel 2 (
        echo.
        echo Installation directory kept.
    ) else (
        echo.
        echo Deleting installation directory...
        rd /s /q "%INSTALL_DIR%"
        if exist "%INSTALL_DIR%" (
            echo ERROR: Failed to delete directory.
            echo Please delete manually: %INSTALL_DIR%
        ) else (
            echo Installation directory deleted successfully.
            REM Also try to remove parent directory if empty
            rd "%LOCALAPPDATA%\ai-context-menu-tools" 2>nul
        )
    )
) else (
    echo No installation found at: %INSTALL_DIR%
)

REM Summary
echo.
echo ===============================================
echo  Uninstallation Summary
echo ===============================================
echo.
echo - User-level registry entries: Removed
if "%IS_ADMIN%"=="1" (
    echo - Admin-level registry entries: Removed
) else (
    reg query "HKEY_CLASSES_ROOT\Directory\shell\OpenWithClaudeCode" >nul 2>&1
    if %errorlevel% equ 0 (
        echo - Admin-level registry entries: Still exist (run as admin to remove)
    ) else (
        echo - Admin-level registry entries: None found
    )
)
if exist "%INSTALL_DIR%" (
    echo - Installation files: Still exist at %INSTALL_DIR%
) else (
    echo - Installation files: Removed
)

echo.
echo Claude Code context menu has been uninstalled.
echo.
pause