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

The compiled installer will be in `installer/output/` and will be named like:

- `ai-context-tools-setup-vX.Y.Z.exe`

(The version comes from `#define MyAppVersion` in `installer/ai-context-tools.iss`.)

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

## Customizing Icons

### Parent "AI Tools" Menu Icon

The icon for the "AI Tools" dropdown menu is `ai-tools.ico` in the repository root folder. It's configured at **line 47** of `ai-context-tools.iss`:

```ini
Source: "..\ai-tools.ico"; DestDir: "{app}"; Flags: ignoreversion
```

To change it, replace the `ai-tools.ico` file in the root folder with your custom icon.

Registry entries at lines 78, 114, and 150 reference this icon as `{app}\ai-tools.ico,0`.

### Individual Tool Icons

Each AI tool has its own icon in the submenu, configured in the `[Files]` section:

- **Claude Code**: `claude-code\claude-code-windows\claude.ico`
- **Gemini CLI**: `gemini-cli\gemini.ico`
- **Codex CLI**: `codex-cli\codex.ico`

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
