# Mac Setup for iOS Development

Complete guide for setting up your Mac for remote iOS builds with Claude Code.

## Quick Links

- **[Quick Start Guide](MAC-QUICK-START.md)** - Get set up in 30 minutes
- **[Complete Setup Guide](MAC-SETUP-COMPLETE.md)** - Full detailed instructions
- **[iOS Build Automation](IOS-BUILD-AUTOMATION.md)** - Automated build workflows

## Scripts

**Mac Setup Script:**
```bash
curl -o ~/setup-mac.sh https://raw.githubusercontent.com/joshmeee/claude-templates/main/scripts/mac-setup-script.sh
chmod +x ~/setup-mac.sh
./setup-mac.sh
```

**Windows SSH Setup:**
```batch
curl -o %TEMP%\windows-mac-ssh-setup.bat https://raw.githubusercontent.com/joshmeee/claude-templates/main/scripts/windows-mac-ssh-setup.bat
%TEMP%\windows-mac-ssh-setup.bat
```

## What This Enables

- ✅ Remote iOS builds from Windows
- ✅ Automated deployment on git push
- ✅ SSH access for Claude Code
- ✅ Xcode operations from anywhere
- ✅ Background builds while using Mac normally

## Support

For issues or questions, see the [main repository](https://github.com/joshmeee/claude-templates).
