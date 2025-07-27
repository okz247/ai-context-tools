@echo off
REM Smart installer for Claude Code context menu integration
REM No admin privileges required - installs to user's local AppData

echo ===============================================
echo  Claude Code Context Menu - Smart Installer
echo ===============================================
echo.

REM Define installation directory
set "INSTALL_DIR=%LOCALAPPDATA%\ai-context-menu-tools\claude"

REM Get the directory where this script is located
set "SOURCE_DIR=%~dp0"
REM Remove trailing backslash
set "SOURCE_DIR=%SOURCE_DIR:~0,-1%"

echo Installation directory: %INSTALL_DIR%
echo Source directory: %SOURCE_DIR%
echo.

REM Create installation directory
echo Creating installation directory...
if not exist "%INSTALL_DIR%" (
    mkdir "%INSTALL_DIR%"
    if errorlevel 1 (
        echo ERROR: Failed to create installation directory
        pause
        exit /b 1
    )
)

REM Copy files to installation directory
echo.
echo Copying files...
echo - claude.bat
copy /Y "%SOURCE_DIR%\claude.bat" "%INSTALL_DIR%\" >nul
if errorlevel 1 (
    echo ERROR: Failed to copy claude.bat
    pause
    exit /b 1
)

echo - claude.ico
copy /Y "%SOURCE_DIR%\claude.ico" "%INSTALL_DIR%\" >nul
if errorlevel 1 (
    echo ERROR: Failed to copy claude.ico
    pause
    exit /b 1
)

echo - uninstall.bat
copy /Y "%SOURCE_DIR%\uninstall.bat" "%INSTALL_DIR%\" >nul
if errorlevel 1 (
    echo ERROR: Failed to copy uninstall.bat
    pause
    exit /b 1
)

echo - smart-install.bat (for future use)
copy /Y "%~f0" "%INSTALL_DIR%\" >nul
if errorlevel 1 (
    echo ERROR: Failed to copy smart-install.bat
    pause
    exit /b 1
)

echo.
echo Files copied successfully!

REM Create registry entries
echo.
echo Creating registry entries...

REM Folder context menu
reg add "HKEY_CURRENT_USER\Software\Classes\Directory\shell\OpenWithClaudeCode" /ve /d "Open with Claude Code" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\Directory\shell\OpenWithClaudeCode" /v "Icon" /d "%INSTALL_DIR%\claude.ico,0" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\Directory\shell\OpenWithClaudeCode\command" /ve /d "\"%INSTALL_DIR%\claude.bat\" \"%%1\"" /f >nul

REM Background context menu
reg add "HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\OpenWithClaudeCode" /ve /d "Open with Claude Code" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\OpenWithClaudeCode" /v "Icon" /d "%INSTALL_DIR%\claude.ico,0" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\OpenWithClaudeCode\command" /ve /d "\"%INSTALL_DIR%\claude.bat\" \"%%V\"" /f >nul

if errorlevel 1 (
    echo ERROR: Failed to create registry entries
    pause
    exit /b 1
)

echo Registry entries created successfully!

REM Installation complete
echo.
echo ===============================================
echo  Installation Complete!
echo ===============================================
echo.
echo Claude Code context menu has been installed to:
echo %INSTALL_DIR%
echo.
echo You can now right-click on any folder to open it with Claude Code.
echo.
echo To uninstall, run: %INSTALL_DIR%\uninstall.bat
echo.
pause