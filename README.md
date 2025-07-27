# Windows AI Context Menu Tools

Add right-click context menu integration for your existing Claude Code CLI or Gemini CLI installations. This tool lets you instantly open any folder in your AI coding assistant directly from Windows Explorer.

## What This Does

Once you have Claude Code CLI or Gemini CLI installed, this adds context menu integration:
1. Right-click any folder in Windows Explorer
2. Select "Open with Claude Code" or "Open in Gemini CLI"

### Claude Code Variants

This repository includes two Claude Code implementations:

**1. Windows Native (`claude-code/claude-code-windows/`)**
- **Native Windows execution** - runs in cmd.exe or Windows Terminal
- **No administrator privileges required** - installs to user profile (`%LOCALAPPDATA%`)
- **Smart installer** - uses `smart-install.bat` to copy files to AppData

**2. WSL Version (`claude-code/claude-code-wsl/`)**
- **WSL execution** - launches Claude Code through Windows Subsystem for Linux
- **Administrator required** - modifies system-wide registry
- **Traditional installer** - uses `install.bat` and includes `uninstall.bat`
- **For users who prefer WSL environment**

### Gemini CLI

**Gemini CLI:**
- **Administrator required** - modifies system-wide registry (`HKEY_CLASSES_ROOT`)
- **PowerShell execution** - runs via PowerShell in Windows Terminal
- **Traditional installer** - modifies registry to point to current location

## Prerequisites

**Required:** Windows 10 or 11 and one of the following:

### For Claude Code Integration:
- Claude Code CLI installed via npm: `npm install -g @anthropic-ai/claude-code`
- Node.js 18 or newer

### For Gemini CLI Integration:
- Gemini CLI installed 

## Installation

### Method 1: Automatic Installation (Recommended)

1. **Download and Extract**
   - Download this repository as ZIP
   - **For Claude Code**: Extract anywhere (files will be copied to AppData)
   - **For Gemini CLI**: Extract to a permanent location (registry points to this folder)

2. **Choose Your Tool**
   - For Claude Code Windows Native: Go to `claude-code/claude-code-windows/`
   - For Claude Code WSL Version: Go to `claude-code/claude-code-wsl/`
   - For Gemini CLI: Go to the `gemini-cli` folder

3. **Run the Installer**
   - **For Claude Code Windows Native**: Double-click `smart-install.bat` (no admin required!)
   - **For Claude Code WSL**: Right-click `install.bat` and select **"Run as administrator"**
   - **For Gemini CLI**: Right-click `install.bat` and select **"Run as administrator"**
   - Follow the prompts (restart Explorer when asked)

### Method 2: Manual Installation

1. **Navigate to Manual Install Folder**
   - For Claude Code Windows Native: Go to `claude-code/claude-code-windows/manual-install/`
   - For Claude Code WSL: Go to `claude-code/claude-code-wsl/manual-install/`
   - For Gemini CLI: Go to `gemini-cli/manual-install/`

2. **For Claude Code**
   - Copy `install.reg.template` to `install.reg`
   - Replace all instances of `C:\\path\\to\\your\\folder` with your actual path
   - Use double backslashes (e.g., `C:\\Users\\YourName\\AppData\\Local\\ai-context-menu-tools\\claude`)
   - Double-click the edited `install.reg` file

3. **For Gemini CLI**
   - Copy `install.reg.template` to `install.reg`
   - Replace `C:\\path\\to\\your\\folder` with your actual path (use double backslashes)
   - Double-click the edited `install.reg` file
   
4. **Apply Changes**
   - Approve security warnings and restart Explorer

## Uninstalling

### Automatic Method
- **For Claude Code Windows Native**: 
  - Run `smart-uninstall.bat` from the original source folder (no admin required)
  - This removes registry entries and optionally deletes the AppData installation
- **For Claude Code WSL**: 
  - Right-click `uninstall.bat` and select **"Run as administrator"**
- **For Gemini CLI**: 
  - Right-click `uninstall.bat` and select **"Run as administrator"**

### Manual Method  
- Double-click `uninstall.reg` in the `manual-install/` folder

## Troubleshooting

### Installation Issues
- **"This app can't run on your PC"**: Right-click and choose "Run as administrator" (Gemini only)
- **No menu appears**: Restart Windows Explorer or reboot your computer
- **Moved folder after installation**: 
  - **Claude Code Windows Native**: No issue - files are copied to AppData
  - **Claude Code WSL**: Must reinstall from new location
  - **Gemini CLI**: Must reinstall from new location

### Runtime Issues  
- **"Claude Code not found"**: Verify Claude Code CLI is installed globally with npm (`claude --version`)
- **"Gemini not found"**: Verify Gemini CLI is installed globally with npm

## License

MIT License - Feel free to modify and share!

## Need Help?

- **Claude Code problems**: See [Claude Code docs](https://docs.anthropic.com/en/docs/claude-code)
- **Gemini CLI problems**: See [Gemini CLI docs](https://github.com/google-gemini/gemini-cli)
