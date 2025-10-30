# Windows AI Context Menu Tools

Add right-click context menu integration for your AI coding assistants. This tool lets you instantly open any folder in Claude Code, Gemini CLI, or Codex directly from Windows Explorer.

## ⚡ Quick Start (Recommended)

**Download the latest installer: [Releases](https://github.com/okz247/ai-context-tools/releases)**

1. Download `ai-context-tools-setup-v1.0.0.exe`
2. Run the installer
3. Select which AI tools to integrate (Claude Code, Gemini, Codex)
4. Done! Right-click any folder to open with your AI assistant

### What This Does

Once installed, you get instant access to your AI assistants:
1. Right-click any folder in Windows Explorer
2. Select "Open with Claude Code", "Open with Gemini CLI", or "Open with Codex"
3. Your AI assistant launches in that folder

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

## Features

✨ **Auto-Detection** - Automatically detects installed AI CLIs
🎯 **Smart Installation** - Only installs context menus for tools you have
🔧 **Easy Uninstall** - Clean removal with built-in uninstaller
⚙️ **No Admin Required** - Claude Code (Windows Native) installs without admin rights
🎨 **Custom Icons** - Each AI tool gets its own icon in the context menu
📦 **Supports Multiple Tools** - Claude Code, Gemini, Codex all in one installer

## Prerequisites

**Required:** Windows 10 or 11

**AI Tools (install at least one):**
- **Claude Code CLI**: `npm install -g @anthropic-ai/claude-code` (Node.js 18+)
- **Gemini CLI**: Install from Gemini documentation
- **Codex CLI**: Install from OpenAI/Codex documentation

## Installation

### Method 1: Easy Installer (Recommended) ⭐

1. **Download** the latest release:
   [Get ai-context-tools-setup-v1.0.0.exe](https://github.com/okz247/ai-context-tools/releases)

2. **Run** the installer (may require administrator privileges)

3. **Select** which AI tools to integrate:
   - ✅ Claude Code (Windows Native) - No admin required
   - ✅ Claude Code (WSL) - For WSL users
   - ✅ Gemini CLI
   - ✅ Codex CLI

4. **Done!** Right-click any folder to see your new AI assistant options

The installer will:
- Automatically detect which AI CLIs you have installed
- Warn you if an AI tool isn't detected (you can still install the context menu for later)
- Create proper registry entries
- Optionally restart Windows Explorer to apply changes immediately

### Method 2: Manual Installation (Advanced)

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

### If Installed with Easy Installer
1. Go to **Settings** → **Apps** → **Installed apps**
2. Find "AI Context Menu Tools"
3. Click **Uninstall**

The uninstaller will remove all context menu entries and registry keys automatically.

### If Installed Manually
- **For Claude Code Windows Native**: Run `smart-uninstall.bat` from the source folder
- **For Claude Code WSL**: Right-click `uninstall.bat` and select **"Run as administrator"**
- **For Gemini CLI**: Right-click `uninstall.bat` and select **"Run as administrator"**
- **Alternative**: Double-click `uninstall.reg` in the `manual-install/` folder

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

## Building the Installer (For Contributors)

Want to build the installer yourself or contribute?

1. Install [Inno Setup 6](https://jrsoftware.org/isdl.php)
2. Open `installer/ai-context-tools.iss` in Inno Setup
3. Click **Build** → **Compile**
4. Find the `.exe` in `installer/output/`

See [`installer/BUILD.md`](installer/BUILD.md) for detailed instructions.

## Contributing

Contributions are welcome! To contribute:

1. Fork this repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

MIT License - Feel free to modify and share!

## Need Help?

- **Installation issues**: [Open an issue](https://github.com/okz247/ai-context-tools/issues)
- **Claude Code problems**: See [Claude Code docs](https://docs.anthropic.com/en/docs/claude-code)
- **Gemini CLI problems**: See [Gemini CLI docs](https://github.com/google-gemini/gemini-cli)
