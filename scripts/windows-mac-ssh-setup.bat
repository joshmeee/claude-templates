@echo off
REM Windows Script to Set Up SSH Connection to Mac
REM This script helps Claude Code SSH into your Mac for iOS builds

echo ==========================================
echo Mac SSH Connection Setup (Windows Side)
echo ==========================================
echo.

REM Check if .ssh directory exists
if not exist "%USERPROFILE%\.ssh" (
    echo Creating .ssh directory...
    mkdir "%USERPROFILE%\.ssh"
)

echo This script will help you set up SSH access to your Mac.
echo.
echo You will need:
echo   1. Mac username
echo   2. Mac IP address or hostname
echo   3. Mac password (one-time only)
echo.

REM Prompt for Mac details
set /p MAC_USER=Enter Mac username:
set /p MAC_HOST=Enter Mac IP or hostname (e.g., 192.168.1.100 or booklend-mac.local):

echo.
echo Testing connection to %MAC_USER%@%MAC_HOST%...
echo.

REM Test basic SSH connection
ssh -o ConnectTimeout=5 %MAC_USER%@%MAC_HOST% "echo 'Connection successful!'" 2>nul

if errorlevel 1 (
    echo.
    echo ERROR: Cannot connect to Mac
    echo.
    echo Troubleshooting:
    echo   1. Is Mac on and connected to network?
    echo   2. Is Remote Login enabled on Mac?
    echo      System Settings ^> General ^> Sharing ^> Remote Login = ON
    echo   3. Are you on the same network as the Mac?
    echo   4. Try pinging: ping %MAC_HOST%
    echo.
    pause
    exit /b 1
)

echo.
echo ✓ Connection successful!
echo.

REM Check if key already exists
if exist "%USERPROFILE%\.ssh\booklend_mac_key" (
    echo SSH key already exists at: %USERPROFILE%\.ssh\booklend_mac_key
    echo.
    set /p REGENERATE=Regenerate key? (y/N):
    if /i not "%REGENERATE%"=="y" goto :test_key_auth
)

echo.
echo Generating SSH key for Mac access...
ssh-keygen -t ed25519 -f "%USERPROFILE%\.ssh\booklend_mac_key" -N "" -C "claude-code-mac-access"

if errorlevel 1 (
    echo ERROR: Failed to generate SSH key
    pause
    exit /b 1
)

echo ✓ SSH key generated
echo.

:copy_key
echo Copying SSH key to Mac...
echo You will be prompted for your Mac password.
echo.

type "%USERPROFILE%\.ssh\booklend_mac_key.pub" | ssh %MAC_USER%@%MAC_HOST% "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"

if errorlevel 1 (
    echo.
    echo ERROR: Failed to copy SSH key
    echo.
    set /p RETRY=Retry? (Y/n):
    if /i not "%RETRY%"=="n" goto :copy_key
    pause
    exit /b 1
)

echo ✓ SSH key copied to Mac
echo.

:test_key_auth
echo Testing passwordless SSH connection...
ssh -i "%USERPROFILE%\.ssh\booklend_mac_key" -o ConnectTimeout=5 %MAC_USER%@%MAC_HOST% "echo 'Passwordless connection successful!'"

if errorlevel 1 (
    echo.
    echo ERROR: Passwordless connection failed
    echo The key may not have been copied correctly.
    echo.
    set /p RECOPY=Try copying key again? (Y/n):
    if /i not "%RECOPY%"=="n" goto :copy_key
    pause
    exit /b 1
)

echo ✓ Passwordless SSH connection works!
echo.

REM Create/update SSH config
echo Creating SSH config entry...
(
    echo.
    echo # Mac for iOS Builds
    echo Host booklend-mac
    echo     HostName %MAC_HOST%
    echo     User %MAC_USER%
    echo     IdentityFile ~/.ssh/booklend_mac_key
    echo     ServerAliveInterval 60
    echo     ServerAliveCountMax 3
) >> "%USERPROFILE%\.ssh\config"

echo ✓ SSH config updated
echo.

REM Test the config
echo Testing SSH config...
ssh -o ConnectTimeout=5 booklend-mac "echo 'SSH config works!'"

if errorlevel 1 (
    echo WARNING: SSH config test failed
    echo You can still connect using:
    echo   ssh -i ~/.ssh/booklend_mac_key %MAC_USER%@%MAC_HOST%
) else (
    echo ✓ SSH config works! You can now use: ssh booklend-mac
)

echo.
echo ==========================================
echo ✅ Setup Complete!
echo ==========================================
echo.
echo SSH Connection Details:
echo   Host: %MAC_HOST%
echo   User: %MAC_USER%
echo   Key:  %USERPROFILE%\.ssh\booklend_mac_key
echo.
echo Quick Connect:
echo   Method 1: ssh booklend-mac
echo   Method 2: ssh -i ~/.ssh/booklend_mac_key %MAC_USER%@%MAC_HOST%
echo.
echo Next Steps:
echo   1. Clone BookLend project on Mac
echo   2. Configure EAS for iOS builds
echo   3. Test iOS build: eas build --platform ios
echo.
echo Claude Code can now SSH into your Mac for:
echo   - iOS builds
echo   - Xcode operations
echo   - Apple-specific development
echo.
pause
