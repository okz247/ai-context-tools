# Windows AI Context Menu Tools

Add right-click context menu integration for your existing Claude Code CLI or Gemini CLI installations. This tool lets you instantly open any folder in your AI coding assistant directly from Windows Explorer.

## What This Does

Once you have Claude Code CLI or Gemini CLI installed, this adds context menu integration:
1. Right-click any folder in Windows Explorer
2. Select "Open with Claude Code" or "Open in Gemini CLI"

### Key Differences Between Tools

**Claude Code:**
- **No administrator privileges required** - installs to user profile (`%LOCALAPPDATA%`)
- **Native Windows execution** - runs in cmd.exe or Windows Terminal
- **Smart installer** - copies files to AppData and creates user-level registry entries
- **Known issue**: `smart-install.bat` tries to copy a non-existent `uninstall.bat` file

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
   - For Claude Code: Go to the `claude-code` folder
   - For Gemini CLI: Go to the `gemini-cli` folder

3. **Run the Installer**
   - **For Claude Code**: Double-click `smart-install.bat` (no admin required!)
   - **For Gemini CLI**: Right-click `install.bat` and select **"Run as administrator"**
   - Follow the prompts (restart Explorer when asked)

### Method 2: Manual Installation

1. **Navigate to Manual Install Folder**
   - Go to `claude-code/manual-install/` or `gemini-cli/manual-install/`

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
- **For Claude Code**: 
  - Run `smart-uninstall.bat` from the original source folder (no admin required)
  - This removes registry entries and optionally deletes the AppData installation
- **For Gemini CLI**: 
  - Right-click `uninstall.bat` and select **"Run as administrator"**

### Manual Method  
- Double-click `uninstall.reg` in the `manual-install/` folder

## Troubleshooting

### Installation Issues
- **"This app can't run on your PC"**: Right-click and choose "Run as administrator" (Gemini only)
- **No menu appears**: Restart Windows Explorer or reboot your computer
- **Claude Code smart-install.bat errors**: The installer tries to copy `uninstall.bat` which doesn't exist - this error can be ignored
- **Moved folder after installation**: 
  - **Claude Code**: No issue - files are copied to AppData
  - **Gemini CLI**: Must reinstall from new location

### Runtime Issues  
- **"Claude Code not found"**: Verify Claude Code CLI is installed globally with npm (`claude --version`)
- **"Gemini not found"**: Verify Gemini CLI is installed globally with npm

## License

MIT License - Feel free to modify and share!

## Need Help?

- **Claude Code problems**: See [Claude Code docs](https://docs.anthropic.com/en/docs/claude-code)
- **Gemini CLI problems**: See [Gemini CLI docs](https://github.com/google-gemini/gemini-cli)
