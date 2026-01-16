# Codex CLI Context Menu Integration

This folder contains scripts for integrating Codex CLI with Windows context menus.

## Files

- `codex.bat` - Windows native launcher (PowerShell)
- `codex-wsl.bat` - WSL launcher for users running Codex in WSL

## Icon

**Note:** A Codex icon file (`codex.ico`) should be placed in this directory for the installer to use.

If you don't have a Codex icon:
1. The context menu will work without an icon
2. You can create/add your own icon later
3. Icons should be `.ico` format (Windows icon file)

## Usage

These scripts are automatically configured by the main installer. They:
- Launch Codex CLI in the selected folder
- Support both Windows native and WSL environments
- Work with right-click context menu on folders
