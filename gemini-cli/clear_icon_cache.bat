@echo off
title Clear Windows Icon Cache
cls

echo This will clear the Windows icon cache and restart Explorer.
echo.
pause

:: Clear icon cache
taskkill /f /im explorer.exe
timeout /t 2 /nobreak > nul
del /f /s /q /a "%LocalAppData%\IconCache.db"
del /f /s /q /a "%LocalAppData%\Microsoft\Windows\Explorer\iconcache*"
timeout /t 2 /nobreak > nul
start explorer.exe

echo.
echo Icon cache cleared! The new icon should now appear.
echo.
pause