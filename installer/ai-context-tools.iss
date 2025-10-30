; AI Context Menu Tools - Inno Setup Installer Script
; Auto-detects Claude Code, Gemini, and Codex installations
; Creates right-click context menu integration for Windows

#define MyAppName "AI Context Menu Tools"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "AI Context Tools Contributors"
#define MyAppURL "https://github.com/okz247/ai-context-tools"

[Setup]
AppId={{B8F9A3D2-7E4C-4F1B-9A2D-8E3F5C6D7A1B}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}/issues
AppUpdatesURL={#MyAppURL}/releases
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=..\LICENSE
OutputDir=.\output
OutputBaseFilename=ai-context-tools-setup-v{#MyAppVersion}
SetupIconFile=..\claude-code\claude-code-windows\claude.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
ArchitecturesInstallIn64BitMode=x64compatible

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Types]
Name: "full"; Description: "Full installation (all detected AI tools)"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "claude_windows"; Description: "Claude Code (Windows Native) - No WSL required"; Types: full
Name: "claude_wsl"; Description: "Claude Code (WSL) - For Windows Subsystem for Linux users"; Types: full
Name: "gemini_windows"; Description: "Gemini CLI (Windows Native) - PowerShell execution"; Types: full
Name: "gemini_wsl"; Description: "Gemini CLI (WSL) - For Windows Subsystem for Linux users"; Types: full
Name: "codex_windows"; Description: "Codex CLI (Windows Native) - PowerShell execution"; Types: full
Name: "codex_wsl"; Description: "Codex CLI (WSL) - For Windows Subsystem for Linux users"; Types: full

[Files]
; Claude Windows Native
Source: "..\claude-code\claude-code-windows\claude.bat"; DestDir: "{app}\claude-windows"; Flags: ignoreversion; Components: claude_windows
Source: "..\claude-code\claude-code-windows\claude.ico"; DestDir: "{app}\claude-windows"; Flags: ignoreversion; Components: claude_windows

; Claude WSL
Source: "..\claude-code\claude-code-wsl\claude.bat"; DestDir: "{app}\claude-wsl"; Flags: ignoreversion; Components: claude_wsl
Source: "..\claude-code\claude-code-wsl\claude.ico"; DestDir: "{app}\claude-wsl"; Flags: ignoreversion; Components: claude_wsl

; Gemini Windows Native
Source: "..\gemini-cli\gemini.ico"; DestDir: "{app}\gemini-windows"; Flags: ignoreversion; Components: gemini_windows

; Gemini WSL
Source: "..\gemini-cli\gemini-wsl.bat"; DestDir: "{app}\gemini-wsl"; Flags: ignoreversion; Components: gemini_wsl
Source: "..\gemini-cli\gemini.ico"; DestDir: "{app}\gemini-wsl"; Flags: ignoreversion; Components: gemini_wsl

; Codex Windows Native
Source: "..\codex-cli\codex.bat"; DestDir: "{app}\codex-windows"; Flags: ignoreversion; Components: codex_windows
Source: "..\codex-cli\codex.ico"; DestDir: "{app}\codex-windows"; Flags: ignoreversion skipifsourcedoesntexist; Components: codex_windows

; Codex WSL
Source: "..\codex-cli\codex-wsl.bat"; DestDir: "{app}\codex-wsl"; Flags: ignoreversion; Components: codex_wsl
Source: "..\codex-cli\codex.ico"; DestDir: "{app}\codex-wsl"; Flags: ignoreversion skipifsourcedoesntexist; Components: codex_wsl

[Registry]
; Claude Code (Windows Native) - HKCU for current user
Root: HKCU; Subkey: "Software\Classes\Directory\shell\OpenWithClaudeCode"; ValueType: string; ValueName: ""; ValueData: "Open with Claude Code"; Flags: uninsdeletekey; Components: claude_windows
Root: HKCU; Subkey: "Software\Classes\Directory\shell\OpenWithClaudeCode"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\claude-windows\claude.ico,0"; Components: claude_windows
Root: HKCU; Subkey: "Software\Classes\Directory\shell\OpenWithClaudeCode\command"; ValueType: string; ValueName: ""; ValueData: """{app}\claude-windows\claude.bat"" ""%1"""; Components: claude_windows
Root: HKCU; Subkey: "Software\Classes\Directory\Background\shell\OpenWithClaudeCode"; ValueType: string; ValueName: ""; ValueData: "Open with Claude Code"; Flags: uninsdeletekey; Components: claude_windows
Root: HKCU; Subkey: "Software\Classes\Directory\Background\shell\OpenWithClaudeCode"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\claude-windows\claude.ico,0"; Components: claude_windows
Root: HKCU; Subkey: "Software\Classes\Directory\Background\shell\OpenWithClaudeCode\command"; ValueType: string; ValueName: ""; ValueData: """{app}\claude-windows\claude.bat"" ""%V"""; Components: claude_windows

; Claude Code (WSL) - HKCR for all users
Root: HKCR; Subkey: "Directory\shell\OpenWithClaudeCodeWSL"; ValueType: string; ValueName: ""; ValueData: "Open with Claude Code (WSL)"; Flags: uninsdeletekey; Components: claude_wsl
Root: HKCR; Subkey: "Directory\shell\OpenWithClaudeCodeWSL"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\claude-wsl\claude.ico,0"; Components: claude_wsl
Root: HKCR; Subkey: "Directory\shell\OpenWithClaudeCodeWSL\command"; ValueType: string; ValueName: ""; ValueData: """{app}\claude-wsl\claude.bat"" ""%1"""; Components: claude_wsl
Root: HKCR; Subkey: "Directory\Background\shell\OpenWithClaudeCodeWSL"; ValueType: string; ValueName: ""; ValueData: "Open with Claude Code (WSL)"; Flags: uninsdeletekey; Components: claude_wsl
Root: HKCR; Subkey: "Directory\Background\shell\OpenWithClaudeCodeWSL"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\claude-wsl\claude.ico,0"; Components: claude_wsl
Root: HKCR; Subkey: "Directory\Background\shell\OpenWithClaudeCodeWSL\command"; ValueType: string; ValueName: ""; ValueData: """{app}\claude-wsl\claude.bat"" ""%V"""; Components: claude_wsl

; Gemini CLI (Windows Native)
Root: HKCR; Subkey: "Directory\shell\OpenInGeminiCLI"; ValueType: string; ValueName: ""; ValueData: "Open with Gemini CLI"; Flags: uninsdeletekey; Components: gemini_windows
Root: HKCR; Subkey: "Directory\shell\OpenInGeminiCLI"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\gemini-windows\gemini.ico,0"; Components: gemini_windows
Root: HKCR; Subkey: "Directory\shell\OpenInGeminiCLI\command"; ValueType: string; ValueName: ""; ValueData: "cmd.exe /c ""powershell.exe -NoExit -Command """"Set-Location -LiteralPath '%1'; gemini"""""""; Components: gemini_windows
Root: HKCR; Subkey: "Directory\Background\shell\OpenInGeminiCLI"; ValueType: string; ValueName: ""; ValueData: "Open with Gemini CLI"; Flags: uninsdeletekey; Components: gemini_windows
Root: HKCR; Subkey: "Directory\Background\shell\OpenInGeminiCLI"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\gemini-windows\gemini.ico,0"; Components: gemini_windows
Root: HKCR; Subkey: "Directory\Background\shell\OpenInGeminiCLI\command"; ValueType: string; ValueName: ""; ValueData: "cmd.exe /c ""powershell.exe -NoExit -Command """"Set-Location -LiteralPath '%V'; gemini"""""""; Components: gemini_windows

; Gemini CLI (WSL)
Root: HKCR; Subkey: "Directory\shell\OpenInGeminiCLIWSL"; ValueType: string; ValueName: ""; ValueData: "Open with Gemini CLI (WSL)"; Flags: uninsdeletekey; Components: gemini_wsl
Root: HKCR; Subkey: "Directory\shell\OpenInGeminiCLIWSL"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\gemini-wsl\gemini.ico,0"; Components: gemini_wsl
Root: HKCR; Subkey: "Directory\shell\OpenInGeminiCLIWSL\command"; ValueType: string; ValueName: ""; ValueData: """{app}\gemini-wsl\gemini-wsl.bat"" ""%1"""; Components: gemini_wsl
Root: HKCR; Subkey: "Directory\Background\shell\OpenInGeminiCLIWSL"; ValueType: string; ValueName: ""; ValueData: "Open with Gemini CLI (WSL)"; Flags: uninsdeletekey; Components: gemini_wsl
Root: HKCR; Subkey: "Directory\Background\shell\OpenInGeminiCLIWSL"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\gemini-wsl\gemini.ico,0"; Components: gemini_wsl
Root: HKCR; Subkey: "Directory\Background\shell\OpenInGeminiCLIWSL\command"; ValueType: string; ValueName: ""; ValueData: """{app}\gemini-wsl\gemini-wsl.bat"" ""%V"""; Components: gemini_wsl

; Codex CLI (Windows Native)
Root: HKCR; Subkey: "Directory\shell\OpenWithCodex"; ValueType: string; ValueName: ""; ValueData: "Open with Codex"; Flags: uninsdeletekey; Components: codex_windows
Root: HKCR; Subkey: "Directory\shell\OpenWithCodex"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\codex-windows\codex.ico,0"; Components: codex_windows
Root: HKCR; Subkey: "Directory\shell\OpenWithCodex\command"; ValueType: string; ValueName: ""; ValueData: """{app}\codex-windows\codex.bat"" ""%1"""; Components: codex_windows
Root: HKCR; Subkey: "Directory\Background\shell\OpenWithCodex"; ValueType: string; ValueName: ""; ValueData: "Open with Codex"; Flags: uninsdeletekey; Components: codex_windows
Root: HKCR; Subkey: "Directory\Background\shell\OpenWithCodex"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\codex-windows\codex.ico,0"; Components: codex_windows
Root: HKCR; Subkey: "Directory\Background\shell\OpenWithCodex\command"; ValueType: string; ValueName: ""; ValueData: """{app}\codex-windows\codex.bat"" ""%V"""; Components: codex_windows

; Codex CLI (WSL)
Root: HKCR; Subkey: "Directory\shell\OpenWithCodexWSL"; ValueType: string; ValueName: ""; ValueData: "Open with Codex (WSL)"; Flags: uninsdeletekey; Components: codex_wsl
Root: HKCR; Subkey: "Directory\shell\OpenWithCodexWSL"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\codex-wsl\codex.ico,0"; Components: codex_wsl
Root: HKCR; Subkey: "Directory\shell\OpenWithCodexWSL\command"; ValueType: string; ValueName: ""; ValueData: """{app}\codex-wsl\codex-wsl.bat"" ""%1"""; Components: codex_wsl
Root: HKCR; Subkey: "Directory\Background\shell\OpenWithCodexWSL"; ValueType: string; ValueName: ""; ValueData: "Open with Codex (WSL)"; Flags: uninsdeletekey; Components: codex_wsl
Root: HKCR; Subkey: "Directory\Background\shell\OpenWithCodexWSL"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\codex-wsl\codex.ico,0"; Components: codex_wsl
Root: HKCR; Subkey: "Directory\Background\shell\OpenWithCodexWSL\command"; ValueType: string; ValueName: ""; ValueData: """{app}\codex-wsl\codex-wsl.bat"" ""%V"""; Components: codex_wsl

[Code]
var
  ClaudeDetected: Boolean;
  GeminiDetected: Boolean;
  CodexDetected: Boolean;
  DetectionPage: TOutputMsgWizardPage;

function CheckCommandExists(Command: String): Boolean;
var
  ResultCode: Integer;
begin
  Result := Exec('cmd.exe', '/c "' + Command + ' --version >nul 2>&1"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
  Result := Result and (ResultCode = 0);
end;

procedure InitializeWizard();
begin
  // Detect installed AI CLIs
  ClaudeDetected := CheckCommandExists('claude');
  GeminiDetected := CheckCommandExists('gemini');
  CodexDetected := CheckCommandExists('codex');

  // Create detection results page
  DetectionPage := CreateOutputMsgPage(wpWelcome,
    'AI Tool Detection',
    'Scanning for installed AI assistants...',
    'The installer has detected the following AI tools on your system:' + #13#10 + #13#10 +
    '• Claude Code CLI: ' + BoolToStr(ClaudeDetected, 'FOUND ✓', 'NOT FOUND ✗') + #13#10 +
    '• Gemini CLI: ' + BoolToStr(GeminiDetected, 'FOUND ✓', 'NOT FOUND ✗') + #13#10 +
    '• Codex CLI: ' + BoolToStr(CodexDetected, 'FOUND ✓', 'NOT FOUND ✗') + #13#10 + #13#10 +
    'You can still install context menu entries for tools that are not yet installed. ' +
    'Just make sure to install the CLI tool later using npm or your package manager.'
  );
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  // Skip the detection page if user clicks Back
  Result := False;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;

  // Show warnings for undetected tools on component selection page
  if CurPageID = wpSelectComponents then
  begin
    if (WizardIsComponentSelected('claude_windows') or WizardIsComponentSelected('claude_wsl')) and not ClaudeDetected then
    begin
      if MsgBox('Claude Code CLI was not detected on your system. ' +
                'The context menu will be created, but it will not work until you install Claude Code CLI.' + #13#10 + #13#10 +
                'Install it with: npm install -g @anthropic-ai/claude-code' + #13#10 + #13#10 +
                'Continue anyway?',
                mbConfirmation, MB_YESNO) = IDNO then
      begin
        Result := False;
        Exit;
      end;
    end;

    if (WizardIsComponentSelected('gemini_windows') or WizardIsComponentSelected('gemini_wsl')) and not GeminiDetected then
    begin
      if MsgBox('Gemini CLI was not detected on your system. ' +
                'The context menu will be created, but it will not work until you install Gemini CLI.' + #13#10 + #13#10 +
                'Continue anyway?',
                mbConfirmation, MB_YESNO) = IDNO then
      begin
        Result := False;
        Exit;
      end;
    end;

    if (WizardIsComponentSelected('codex_windows') or WizardIsComponentSelected('codex_wsl')) and not CodexDetected then
    begin
      if MsgBox('Codex CLI was not detected on your system. ' +
                'The context menu will be created, but it will not work until you install Codex CLI.' + #13#10 + #13#10 +
                'Continue anyway?',
                mbConfirmation, MB_YESNO) = IDNO then
      begin
        Result := False;
        Exit;
      end;
    end;
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode: Integer;
begin
  if CurStep = ssPostInstall then
  begin
    // Refresh Windows Explorer to show new context menu items
    if MsgBox('Installation complete! Windows Explorer needs to be restarted to show the new context menu items.' + #13#10 + #13#10 +
              'Restart Explorer now?', mbConfirmation, MB_YESNO) = IDYES then
    begin
      Exec('taskkill.exe', '/f /im explorer.exe', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
      Exec('explorer.exe', '', '', SW_SHOW, ewNoWait, ResultCode);
    end;
  end;
end;

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Run]
; Optional: Open GitHub repo after installation
Filename: "{#MyAppURL}"; Description: "Visit the project on GitHub"; Flags: postinstall shellexec skipifsilent
