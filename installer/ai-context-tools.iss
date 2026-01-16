; AI Context Menu Tools - Inno Setup Installer Script
; Auto-detects Claude Code, Gemini, and Codex installations
; Creates right-click context menu integration for Windows

#define MyAppName "AI Context Menu Tools"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "AI Context Tools Contributors"
#define MyAppURL "https://github.com/okz247/ai-context-tools"

[Setup]
AppId={{B8F9A3D2-7E4C-4F1B-9A2D-8E3F5C6D7A1B}}
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
; Always-installed generic icon for parent "AI Tools" menu
Source: "..\claude-code\claude-code-windows\claude.ico"; DestDir: "{app}"; DestName: "ai-tools.ico"; Flags: ignoreversion

; Claude Windows Native
Source: "..\claude-code\claude-code-windows\claude.bat"; DestDir: "{app}\claude-windows"; Flags: ignoreversion; Components: claude_windows
Source: "..\claude-code\claude-code-windows\claude.ico"; DestDir: "{app}\claude-windows"; Flags: ignoreversion; Components: claude_windows

; Claude WSL
Source: "..\claude-code\claude-code-wsl\claude.bat"; DestDir: "{app}\claude-wsl"; Flags: ignoreversion; Components: claude_wsl
Source: "..\claude-code\claude-code-wsl\claude.ico"; DestDir: "{app}\claude-wsl"; Flags: ignoreversion; Components: claude_wsl

; Gemini Windows Native
Source: "..\gemini-cli\gemini.ico"; DestDir: "{app}\gemini-windows"; Flags: ignoreversion; Components: gemini_windows
Source: "..\gemini-cli\gemini.bat"; DestDir: "{app}\gemini-windows"; Flags: ignoreversion; Components: gemini_windows

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
; ========== AI TOOLS SUBMENU FOR FOLDERS ==========
; Create "AI Tools" parent menu for folders
Root: HKCR; Subkey: "Directory\shell\AITools"; ValueType: string; ValueName: "MUIVerb"; ValueData: "AI Tools"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Directory\shell\AITools"; ValueType: string; ValueName: "SubCommands"; ValueData: ""
Root: HKCR; Subkey: "Directory\shell\AITools"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\ai-tools.ico,0"

; Claude Code (Windows)
Root: HKCR; Subkey: "Directory\shell\AITools\shell\ClaudeCode"; ValueType: string; ValueName: ""; ValueData: "Claude Code"; Components: claude_windows
Root: HKCR; Subkey: "Directory\shell\AITools\shell\ClaudeCode"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\claude-windows\claude.ico,0"; Components: claude_windows
Root: HKCR; Subkey: "Directory\shell\AITools\shell\ClaudeCode\command"; ValueType: string; ValueName: ""; ValueData: """{app}\claude-windows\claude.bat"" ""%1"""; Components: claude_windows

; Claude Code (WSL)
Root: HKCR; Subkey: "Directory\shell\AITools\shell\ClaudeCodeWSL"; ValueType: string; ValueName: ""; ValueData: "Claude Code (WSL)"; Components: claude_wsl
Root: HKCR; Subkey: "Directory\shell\AITools\shell\ClaudeCodeWSL"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\claude-wsl\claude.ico,0"; Components: claude_wsl
Root: HKCR; Subkey: "Directory\shell\AITools\shell\ClaudeCodeWSL\command"; ValueType: string; ValueName: ""; ValueData: """{app}\claude-wsl\claude.bat"" ""%1"""; Components: claude_wsl

; Gemini CLI (Windows)
Root: HKCR; Subkey: "Directory\shell\AITools\shell\GeminiCLI"; ValueType: string; ValueName: ""; ValueData: "Gemini CLI"; Components: gemini_windows
Root: HKCR; Subkey: "Directory\shell\AITools\shell\GeminiCLI"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\gemini-windows\gemini.ico,0"; Components: gemini_windows
Root: HKCR; Subkey: "Directory\shell\AITools\shell\GeminiCLI\command"; ValueType: string; ValueName: ""; ValueData: """{app}\gemini-windows\gemini.bat"" ""%1"""; Components: gemini_windows

; Gemini CLI (WSL)
Root: HKCR; Subkey: "Directory\shell\AITools\shell\GeminiCLIWSL"; ValueType: string; ValueName: ""; ValueData: "Gemini CLI (WSL)"; Components: gemini_wsl
Root: HKCR; Subkey: "Directory\shell\AITools\shell\GeminiCLIWSL"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\gemini-wsl\gemini.ico,0"; Components: gemini_wsl
Root: HKCR; Subkey: "Directory\shell\AITools\shell\GeminiCLIWSL\command"; ValueType: string; ValueName: ""; ValueData: """{app}\gemini-wsl\gemini-wsl.bat"" ""%1"""; Components: gemini_wsl

; Codex (Windows)
Root: HKCR; Subkey: "Directory\shell\AITools\shell\Codex"; ValueType: string; ValueName: ""; ValueData: "Codex"; Components: codex_windows
Root: HKCR; Subkey: "Directory\shell\AITools\shell\Codex"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\codex-windows\codex.ico,0"; Components: codex_windows
Root: HKCR; Subkey: "Directory\shell\AITools\shell\Codex\command"; ValueType: string; ValueName: ""; ValueData: """{app}\codex-windows\codex.bat"" ""%1"""; Components: codex_windows

; Codex (WSL)
Root: HKCR; Subkey: "Directory\shell\AITools\shell\CodexWSL"; ValueType: string; ValueName: ""; ValueData: "Codex (WSL)"; Components: codex_wsl
Root: HKCR; Subkey: "Directory\shell\AITools\shell\CodexWSL"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\codex-wsl\codex.ico,0"; Components: codex_wsl
Root: HKCR; Subkey: "Directory\shell\AITools\shell\CodexWSL\command"; ValueType: string; ValueName: ""; ValueData: """{app}\codex-wsl\codex-wsl.bat"" ""%1"""; Components: codex_wsl

; ========== AI TOOLS SUBMENU FOR DIRECTORY BACKGROUND ==========
; Create "AI Tools" parent menu for folder backgrounds
Root: HKCR; Subkey: "Directory\Background\shell\AITools"; ValueType: string; ValueName: "MUIVerb"; ValueData: "AI Tools"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Directory\Background\shell\AITools"; ValueType: string; ValueName: "SubCommands"; ValueData: ""
Root: HKCR; Subkey: "Directory\Background\shell\AITools"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\ai-tools.ico,0"

; Claude Code (Windows)
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\ClaudeCode"; ValueType: string; ValueName: ""; ValueData: "Claude Code"; Components: claude_windows
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\ClaudeCode"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\claude-windows\claude.ico,0"; Components: claude_windows
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\ClaudeCode\command"; ValueType: string; ValueName: ""; ValueData: """{app}\claude-windows\claude.bat"" ""%V"""; Components: claude_windows

; Claude Code (WSL)
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\ClaudeCodeWSL"; ValueType: string; ValueName: ""; ValueData: "Claude Code (WSL)"; Components: claude_wsl
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\ClaudeCodeWSL"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\claude-wsl\claude.ico,0"; Components: claude_wsl
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\ClaudeCodeWSL\command"; ValueType: string; ValueName: ""; ValueData: """{app}\claude-wsl\claude.bat"" ""%V"""; Components: claude_wsl

; Gemini CLI (Windows)
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\GeminiCLI"; ValueType: string; ValueName: ""; ValueData: "Gemini CLI"; Components: gemini_windows
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\GeminiCLI"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\gemini-windows\gemini.ico,0"; Components: gemini_windows
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\GeminiCLI\command"; ValueType: string; ValueName: ""; ValueData: """{app}\gemini-windows\gemini.bat"" ""%V"""; Components: gemini_windows

; Gemini CLI (WSL)
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\GeminiCLIWSL"; ValueType: string; ValueName: ""; ValueData: "Gemini CLI (WSL)"; Components: gemini_wsl
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\GeminiCLIWSL"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\gemini-wsl\gemini.ico,0"; Components: gemini_wsl
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\GeminiCLIWSL\command"; ValueType: string; ValueName: ""; ValueData: """{app}\gemini-wsl\gemini-wsl.bat"" ""%V"""; Components: gemini_wsl

; Codex (Windows)
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\Codex"; ValueType: string; ValueName: ""; ValueData: "Codex"; Components: codex_windows
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\Codex"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\codex-windows\codex.ico,0"; Components: codex_windows
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\Codex\command"; ValueType: string; ValueName: ""; ValueData: """{app}\codex-windows\codex.bat"" ""%V"""; Components: codex_windows

; Codex (WSL)
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\CodexWSL"; ValueType: string; ValueName: ""; ValueData: "Codex (WSL)"; Components: codex_wsl
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\CodexWSL"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\codex-wsl\codex.ico,0"; Components: codex_wsl
Root: HKCR; Subkey: "Directory\Background\shell\AITools\shell\CodexWSL\command"; ValueType: string; ValueName: ""; ValueData: """{app}\codex-wsl\codex-wsl.bat"" ""%V"""; Components: codex_wsl

; ========== AI TOOLS SUBMENU FOR FILES ==========
; Create "AI Tools" parent menu for files
Root: HKCR; Subkey: "*\shell\AITools"; ValueType: string; ValueName: "MUIVerb"; ValueData: "AI Tools"; Flags: uninsdeletekey
Root: HKCR; Subkey: "*\shell\AITools"; ValueType: string; ValueName: "SubCommands"; ValueData: ""
Root: HKCR; Subkey: "*\shell\AITools"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\ai-tools.ico,0"

; Claude Code (Windows)
Root: HKCR; Subkey: "*\shell\AITools\shell\ClaudeCode"; ValueType: string; ValueName: ""; ValueData: "Claude Code"; Components: claude_windows
Root: HKCR; Subkey: "*\shell\AITools\shell\ClaudeCode"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\claude-windows\claude.ico,0"; Components: claude_windows
Root: HKCR; Subkey: "*\shell\AITools\shell\ClaudeCode\command"; ValueType: string; ValueName: ""; ValueData: """{app}\claude-windows\claude.bat"" ""%1"""; Components: claude_windows

; Claude Code (WSL)
Root: HKCR; Subkey: "*\shell\AITools\shell\ClaudeCodeWSL"; ValueType: string; ValueName: ""; ValueData: "Claude Code (WSL)"; Components: claude_wsl
Root: HKCR; Subkey: "*\shell\AITools\shell\ClaudeCodeWSL"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\claude-wsl\claude.ico,0"; Components: claude_wsl
Root: HKCR; Subkey: "*\shell\AITools\shell\ClaudeCodeWSL\command"; ValueType: string; ValueName: ""; ValueData: """{app}\claude-wsl\claude.bat"" ""%1"""; Components: claude_wsl

; Gemini CLI (Windows)
Root: HKCR; Subkey: "*\shell\AITools\shell\GeminiCLI"; ValueType: string; ValueName: ""; ValueData: "Gemini CLI"; Components: gemini_windows
Root: HKCR; Subkey: "*\shell\AITools\shell\GeminiCLI"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\gemini-windows\gemini.ico,0"; Components: gemini_windows
Root: HKCR; Subkey: "*\shell\AITools\shell\GeminiCLI\command"; ValueType: string; ValueName: ""; ValueData: """{app}\gemini-windows\gemini.bat"" ""%1"""; Components: gemini_windows

; Gemini CLI (WSL)
Root: HKCR; Subkey: "*\shell\AITools\shell\GeminiCLIWSL"; ValueType: string; ValueName: ""; ValueData: "Gemini CLI (WSL)"; Components: gemini_wsl
Root: HKCR; Subkey: "*\shell\AITools\shell\GeminiCLIWSL"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\gemini-wsl\gemini.ico,0"; Components: gemini_wsl
Root: HKCR; Subkey: "*\shell\AITools\shell\GeminiCLIWSL\command"; ValueType: string; ValueName: ""; ValueData: """{app}\gemini-wsl\gemini-wsl.bat"" ""%1"""; Components: gemini_wsl

; Codex (Windows)
Root: HKCR; Subkey: "*\shell\AITools\shell\Codex"; ValueType: string; ValueName: ""; ValueData: "Codex"; Components: codex_windows
Root: HKCR; Subkey: "*\shell\AITools\shell\Codex"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\codex-windows\codex.ico,0"; Components: codex_windows
Root: HKCR; Subkey: "*\shell\AITools\shell\Codex\command"; ValueType: string; ValueName: ""; ValueData: """{app}\codex-windows\codex.bat"" ""%1"""; Components: codex_windows

; Codex (WSL)
Root: HKCR; Subkey: "*\shell\AITools\shell\CodexWSL"; ValueType: string; ValueName: ""; ValueData: "Codex (WSL)"; Components: codex_wsl
Root: HKCR; Subkey: "*\shell\AITools\shell\CodexWSL"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\codex-wsl\codex.ico,0"; Components: codex_wsl
Root: HKCR; Subkey: "*\shell\AITools\shell\CodexWSL\command"; ValueType: string; ValueName: ""; ValueData: """{app}\codex-wsl\codex-wsl.bat"" ""%1"""; Components: codex_wsl

[Code]
var
  ClaudeDetected: Boolean;
  GeminiDetected: Boolean;
  CodexDetected: Boolean;
  DetectionPage: TOutputMsgWizardPage;

const
  SHCNE_ASSOCCHANGED = $08000000;
  SHCNF_IDLIST = $0000;
  SHCNF_FLUSHNOWAIT = $2000;

procedure SHChangeNotify(wEventID: Integer; uFlags: Cardinal; dwItem1, dwItem2: Cardinal);
  external 'SHChangeNotify@shell32.dll stdcall';

function CheckCommandExists(Command: String): Boolean;
var
  ResultCode: Integer;
begin
  // Try using 'where' command to check if the command is in PATH
  Result := Exec('cmd.exe', '/c "where ' + Command + ' >nul 2>&1"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
  if not Result or (ResultCode <> 0) then
  begin
    // Fallback: Try running the command with --version
    Result := Exec('cmd.exe', '/c "' + Command + ' --version >nul 2>&1"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    Result := Result and (ResultCode = 0);
  end
  else
    Result := True;
end;

procedure InitializeWizard();
var
  DetectionMsg: String;
begin
  // Detect installed AI CLIs
  ClaudeDetected := CheckCommandExists('claude');
  GeminiDetected := CheckCommandExists('gemini');
  CodexDetected := CheckCommandExists('codex');

  // Build detection message
  DetectionMsg := 'The installer has detected the following AI tools on your system:' + #13#10 + #13#10;

  if ClaudeDetected then
    DetectionMsg := DetectionMsg + '• Claude Code CLI: FOUND ✓' + #13#10
  else
    DetectionMsg := DetectionMsg + '• Claude Code CLI: NOT FOUND ✗' + #13#10;

  if GeminiDetected then
    DetectionMsg := DetectionMsg + '• Gemini CLI: FOUND ✓' + #13#10
  else
    DetectionMsg := DetectionMsg + '• Gemini CLI: NOT FOUND ✗' + #13#10;

  if CodexDetected then
    DetectionMsg := DetectionMsg + '• Codex CLI: FOUND ✓' + #13#10
  else
    DetectionMsg := DetectionMsg + '• Codex CLI: NOT FOUND ✗' + #13#10;

  DetectionMsg := DetectionMsg + #13#10 +
    'You can still install context menu entries for tools that are not yet installed. ' +
    'Just make sure to install the CLI tool later using npm or your package manager.';

  // Create detection results page
  DetectionPage := CreateOutputMsgPage(wpWelcome,
    'AI Tool Detection',
    'Scanning for installed AI assistants...',
    DetectionMsg
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

procedure RefreshExplorerShell;
begin
  // Updates shell caches so context menu changes show up without restarting Explorer.
  // For SHCNE_ASSOCCHANGED: dwItem1/dwItem2 must be NULL and SHCNF_IDLIST must be used.
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST or SHCNF_FLUSHNOWAIT, 0, 0);
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode: Integer;
  ErrorCode: Integer;
  Started: Boolean;
begin
  if CurStep = ssPostInstall then
  begin
    // Apply changes so new context menu items appear.
    // Restarting Explorer is a heavy-handed approach and can fail to relaunch when Setup is elevated.
    // Offer a safe refresh first, with restart only as a fallback.
    case MsgBox(
      'Installation complete!' + #13#10 + #13#10 +
      'To show the new context menu items, choose an option:' + #13#10 + #13#10 +
      'YES = Refresh Explorer (recommended, no restart)' + #13#10 +
      'NO  = Restart Explorer (may close your open windows)' + #13#10 +
      'CANCEL = Do nothing (you can log off/restart later)',
      mbConfirmation, MB_YESNOCANCEL) of
      IDYES:
        begin
          RefreshExplorerShell;
        end;
      IDNO:
        begin
          Exec('taskkill.exe', '/f /im explorer.exe', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
          Sleep(1000);  // Wait 1 second for Explorer to fully terminate
          // Try to relaunch Explorer in the original (non-admin) user context.
          Started := False;
          ErrorCode := 0;
          try
            Started := ExecAsOriginalUser(ExpandConstant('{sys}\explorer.exe'), '', '', SW_SHOWNORMAL, ewNoWait, ResultCode);
          except
            Started := False;
          end;

          if not Started then
          begin
            // Alternative original-user launch via ShellExecute (sometimes behaves better for Explorer).
            try
              Started := ShellExecAsOriginalUser('open', ExpandConstant('{sys}\explorer.exe'), '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
            except
              Started := False;
            end;
          end;

          if not Started then
          begin
            // Last-resort fallback: attempt normal start (may still fail under UAC/session rules).
            Started := Exec(ExpandConstant('{sys}\explorer.exe'), '', '', SW_SHOWNORMAL, ewNoWait, ResultCode);
          end;

          if not Started then
          begin
            MsgBox(
              'Explorer could not be restarted automatically.' + #13#10 + #13#10 +
              'Fix: press Ctrl+Shift+Esc → Task Manager → Run new task → type: explorer.exe → OK.' + #13#10 + #13#10 +
              'Error: ' + SysErrorMessage(ErrorCode),
              mbError, MB_OK);
          end;
        end;
    end;
  end;
end;

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Run]
; Optional: Open GitHub repo after installation
Filename: "{#MyAppURL}"; Description: "Visit the project on GitHub"; Flags: postinstall shellexec skipifsilent
