# Changelog

Refer to changelog-ai-instructions.md for formatting guidelines

ALL changes MUST be timestamped in eastern time using Time MCP Server.

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed - 2025-07-27 2:57 AM ET
- Identified inaccuracy in README.md regarding `smart-install.bat` attempting to copy non-existent `uninstall.bat`
  - The `uninstall.bat` file does not exist in the claude-code folder
  - `smart-install.bat` lines 52-58 attempt to copy this file, causing an error
  - This is documented as a "known issue" in README line 89 but can be easily fixed

### Removed - 2025-07-27 2:20 AM ET
- Cleaned up obsolete files from previous Claude Code implementation
  - Deleted `claude.bat.wsl-backup` (old WSL-based launcher)
  - Deleted `install.bat` (old admin-required installer)
  - Deleted `uninstall.bat` (old uninstaller)
  - Deleted `test-batch.bat` and `test_claude_not_found.bat` (test files)
  - Deleted `smart-uninstall.ps1` and `smart-uninstall-debug.bat` (redundant uninstallers)
  - Deleted `cc_WINDOWS_NATIVE_PLAN.md` (implementation plan document)

### Changed - 2025-07-26 5:43 PM EDT
- Claude Code context menu now uses native Windows execution instead of WSL
  - Removed WSL dependency for Claude launcher
  - Added automatic Windows Terminal detection with cmd.exe fallback
  - Improved error handling with Claude installation detection
  - Created backup of original WSL-based launcher (`claude.bat.wsl-backup`)
  - Added README.md documentation for Claude Code tool

### Added - 2025-07-26 5:43 PM EDT
- Installation plan for relocating tools to `%LOCALAPPDATA%\ai-context-menu-tools\`
- Smart installer concept to avoid manual file placement
- Registry approach using `HKEY_CURRENT_USER` to eliminate admin requirements

### Added - 2025-07-26 3:36 PM EDT
- Claude settings configuration files (`.claude/settings.local.json`) for managing tool permissions
- Windows icon cache clearing utility (`gemini-cli/clear_icon_cache.bat`) to refresh system icons

### Changed - 2025-07-12 4:02 AM EDT
- Updated Gemini logo

### Changed - 2025-07-06 2:16 PM EDT
- Modified Gemini CLI context menu text from "open in" to "open with" for better clarity

## [0.1.0] - 2025-07-06 1:58 PM EDT

### Added
- Initial release of AI Context Tools
- Claude Code context menu integration for Windows
  - Right-click context menu option for folders
  - Custom Claude icon
  - Batch installer and uninstaller scripts
  - Manual registry templates
- Gemini CLI context menu integration for Windows
  - Right-click context menu option for folders
  - Custom Gemini icon
  - Batch installer and uninstaller scripts
  - Manual registry templates
- README documentation with installation instructions

