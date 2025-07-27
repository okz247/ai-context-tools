# AI Context Menu Tools Installation Plan

## Overview
Create a self-installing system that automatically copies files to a permanent location and updates registry entries, making installation simple and location-independent.

## Target Directory Structure
```
C:\Users\Omar\AppData\Local\ai-context-menu-tools\
    ├── claude\
    │   ├── claude.bat
    │   ├── claude.ico
    │   ├── install.bat
    │   └── uninstall.bat
    └── gemini\
        ├── gemini.bat
        ├── gemini.ico
        ├── install.bat
        └── uninstall.bat
```

## Implementation Steps

### 1. Create New Smart Installer for Claude
Create `smart-install.bat` that will:
- No admin privileges needed!
- Create directory structure at `%LOCALAPPDATA%\ai-context-menu-tools\claude\`
- Copy all Claude files to the new location:
  - `claude.bat`
  - `claude.ico`
  - `uninstall.bat`
- Update registry entries to point to the new location:
  - `HKEY_CURRENT_USER\Software\Classes\Directory\shell\OpenWithClaudeCode`
  - `HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\OpenWithClaudeCode`
- Offer to delete source files after successful installation
- Create a copy of itself in the target directory for future use

### 2. Update Uninstaller
Modify `uninstall.bat` to:
- Remove all registry entries
- Display the installation directory path
- Offer to delete the installed files
- Work correctly from the new installed location

### 3. Create Smart Installer for Gemini
Create `smart-install.bat` for Gemini following the same pattern:
- Install to `%LOCALAPPDATA%\ai-context-menu-tools\gemini\`
- Update Gemini-specific registry entries
- Copy all Gemini files

### 4. Create Master Installer (Optional)
Create `install-all.bat` in the project root that:
- Installs both Claude and Gemini tools in sequence
- Creates the full directory structure
- Provides a single installation point for all tools
- Shows summary of what was installed

### 5. File Organization
Current structure to be maintained for development:
```
ai-context-tools\
    ├── claude-code\
    │   ├── claude.bat (updated for native Windows)
    │   ├── claude.ico
    │   ├── install.bat (current installer)
    │   ├── smart-install.bat (new self-contained installer)
    │   └── uninstall.bat
    ├── gemini-cli\
    │   ├── gemini.bat
    │   ├── gemini.ico
    │   ├── install.bat
    │   ├── smart-install.bat (new self-contained installer)
    │   └── uninstall.bat
    └── install-all.bat (optional master installer)
```

## Benefits

1. **No Admin Required**: Uses HKEY_CURRENT_USER instead of HKEY_CLASSES_ROOT
2. **Location Independence**: Run installer from anywhere (Downloads, Desktop, USB drive)
3. **Clean Organization**: All AI context menu tools in one standard location
4. **Easy Maintenance**: Clear folder structure in AppData\Local
5. **Simple Uninstall**: Each tool has its own uninstaller
6. **No Manual Steps**: Everything automated, no need to move files manually
7. **Future-Proof**: Easy to add more AI tools later
8. **User-Friendly**: No UAC prompts or elevation required

## Technical Details

### Registry Entries (No Admin Required!)
The installers will use `HKEY_CURRENT_USER\Software\Classes` instead of `HKEY_CLASSES_ROOT` to avoid requiring administrator privileges:

**For Claude:**
```
[HKEY_CURRENT_USER\Software\Classes\Directory\shell\OpenWithClaudeCode]
@="Open with Claude Code"
"Icon"="%LOCALAPPDATA%\\ai-context-menu-tools\\claude\\claude.ico,0"

[HKEY_CURRENT_USER\Software\Classes\Directory\shell\OpenWithClaudeCode\command]
@="%LOCALAPPDATA%\\ai-context-menu-tools\\claude\\claude.bat \"%1\""

[HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\OpenWithClaudeCode]
@="Open with Claude Code"
"Icon"="%LOCALAPPDATA%\\ai-context-menu-tools\\claude\\claude.ico,0"

[HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\OpenWithClaudeCode\command]
@="%LOCALAPPDATA%\\ai-context-menu-tools\\claude\\claude.bat \"%V\""
```

**For Gemini:** Similar structure with "OpenWithGemini" keys

**Note:** Using `%LOCALAPPDATA%` in registry entries ensures they work for any user without hardcoding paths.

### Installation Flow

1. User downloads the ai-context-tools folder
2. User runs `smart-install.bat` from any location
3. Script copies itself and related files to AppData\Local
4. Registry entries are created pointing to the new location
5. Original files can be deleted
6. Context menu items are immediately available

### Uninstallation Flow

1. User runs uninstall.bat from the installed location
2. Script removes registry entries
3. Script offers to delete the installation folder
4. Clean removal with no leftovers

## Next Steps

1. Create the smart installer for Claude (highest priority)
2. Test the installation process
3. Create the smart installer for Gemini
4. Create the optional master installer
5. Update documentation