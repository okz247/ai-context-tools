# Claude Code Context Menu for Windows

This tool adds "Open with Claude Code" to the Windows context menu, allowing you to quickly launch Claude Code CLI in any folder.

## Features

- **Native Windows Support**: Runs Claude Code directly without WSL
- **Smart Terminal Detection**: Uses Windows Terminal if available, falls back to Command Prompt
- **Easy Installation**: Run `install.bat` as Administrator
- **Clean Uninstallation**: Run `uninstall.bat` as Administrator

## Requirements

- Windows 10 or Windows 11
- Claude Code CLI installed via npm: `npm install -g @anthropic-ai/claude-code`
- Node.js 18 or newer

## Installation

1. Install Claude Code CLI if not already installed:
   ```bash
   npm install -g @anthropic-ai/claude-code
   ```

2. Right-click `install.bat` and select "Run as administrator"

3. The context menu will be added to:
   - Folder right-click menu
   - Folder background right-click menu

## Usage

Right-click on any folder or inside any folder and select "Open with Claude Code" to launch Claude in that directory.

## Troubleshooting

If Claude doesn't launch:
1. Ensure Claude Code CLI is installed: `claude --version`
2. Make sure npm's global directory is in your PATH
3. Try running `claude` directly from Command Prompt

## Files

- `claude.bat` - Main launcher script
- `claude.ico` - Icon for context menu
- `install.bat` - Installation script
- `uninstall.bat` - Uninstallation script
- `claude.bat.wsl-backup` - Original WSL-based version (backup)