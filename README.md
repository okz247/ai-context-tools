# Windows AI Context Menu Tools

Add right-click context menu integration for your existing Claude Code CLI or Gemini CLI installations. This tool lets you instantly open any folder in your AI coding assistant directly from Windows Explorer.

## What This Does

Once you have Claude Code CLI or Gemini CLI installed, this adds context menu integration:
1. Right-click any folder in Windows Explorer
2. Select "Open with Claude Code" or "Open in Gemini CLI"

## Prerequisites

**Required:** Windows 10 or 11 and one of the following:

### For Claude Code Integration:
- Claude Code CLI installed 

### For Gemini CLI Integration:
- Gemini CLI installed 

## Installation

**Note**: Extract to a permanent location (like `C:\Tools\`) - don't install from your Downloads folder!

### Method 1: Automatic Installation (Recommended)

1. **Download and Extract**
   - Download this repository as ZIP
   - Extract to a permanent location

2. **Choose Your Tool**
   - For Claude Code: Go to the `claude-code` folder
   - For Gemini CLI: Go to the `gemini-cli` folder

3. **Run the Installer**
   - Right-click `install.bat` and select **"Run as administrator"**
   - Follow the prompts (restart Explorer when asked)

### Method 2: Manual Installation

1. **Navigate to Manual Install Folder**
   - Go to `claude-code/manual-install/` or `gemini-cli/manual-install/`

2. **Edit Registry Template** (Claude Code only)
   - Copy `install.reg.template` to `install.reg`
   - Replace `C:\\path\\to\\your\\folder` with your actual path (use double backslashes)

3. **Apply Registry Changes**
   - Double-click the `install.reg` file
   - Approve security warnings and restart Explorer

## Uninstalling

### Automatic Method
- Right-click `uninstall.bat` in your tool's folder and select **"Run as administrator"**

### Manual Method  
- Double-click `uninstall.reg` in the `manual-install/` folder

## Troubleshooting

### Installation Issues
- **"This app can't run on your PC"**: Right-click and choose "Run as administrator"
- **No menu appears**: Restart Windows Explorer or reboot your computer
- **Moved folder after installation**: Reinstall from the new location

### Runtime Issues  
- **"WSL not found"**: Ensure WSL is installed and working
- **"Claude Code not found"**: Verify Claude Code CLI is installed in your WSL environment
- **"Gemini not found"**: Verify Gemini CLI is installed globally with npm

## License

MIT License - Feel free to modify and share!

## Need Help?

- **Claude Code problems**: See [Claude Code docs](https://docs.anthropic.com/en/docs/claude-code)
- **Gemini CLI problems**: See [Gemini CLI docs](https://github.com/google-gemini/gemini-cli)
