# Building the Installer

This document explains how to build the AI Context Tools installer executable.

## Prerequisites

1. **Windows OS** (Windows 10 or 11)
2. **Inno Setup 6** - Download from https://jrsoftware.org/isdl.php

## Building Locally

### Method 1: Using Inno Setup GUI

1. Install Inno Setup from https://jrsoftware.org/isdl.php
2. Open `installer/ai-context-tools.iss` in Inno Setup
3. Click **Build** → **Compile**
4. The installer will be created in `installer/output/`

### Method 2: Command Line

```cmd
"C:\Program Files (x86)\Inno Setup 6\ISCC.exe" installer\ai-context-tools.iss
```

The compiled installer will be in `installer/output/ai-context-tools-setup-v1.0.0.exe`

## GitHub Actions (Automated)

Releases are automatically built when you create a git tag:

```bash
git tag v1.0.0
git push origin v1.0.0
```

The GitHub Actions workflow will:
1. Build the installer on Windows
2. Create a GitHub release
3. Attach the `.exe` installer

## Installer Structure

The Inno Setup script (`ai-context-tools.iss`) includes:

- **Auto-detection** of Claude Code, Gemini, and Codex CLIs
- **Component selection** for custom installations
- **Registry entries** for context menu integration
- **Uninstaller** automatically created
- **Explorer restart** option after installation

## Modifying the Installer

Edit `installer/ai-context-tools.iss` to:

- Change version number (update `#define MyAppVersion`)
- Add new AI tools (add components, files, and registry entries)
- Customize UI text and dialogs
- Modify installation paths

## Testing

After building:

1. Run the installer in a test environment
2. Right-click a folder to verify context menu entries
3. Test uninstaller
4. Verify registry entries in `regedit`:
   - `HKEY_CURRENT_USER\Software\Classes\Directory\shell\`
   - `HKEY_CLASSES_ROOT\Directory\shell\`

## Troubleshooting

**"ISCC.exe not found"**
- Verify Inno Setup is installed
- Check installation path matches command

**"File not found" during build**
- Ensure all source files exist in their expected locations
- Check paths in `[Files]` section of `.iss` script

**Registry entries not working**
- Restart Windows Explorer after installation
- Check if running as Administrator (required for HKCR entries)

## Release Checklist

Before creating a release:

- [ ] Update version number in `ai-context-tools.iss`
- [ ] Test installer on clean Windows installation
- [ ] Verify all AI tool detections work
- [ ] Check uninstaller removes all registry entries
- [ ] Update CHANGELOG.md
- [ ] Create git tag matching version
