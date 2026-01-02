# Mac Quick Start Guide
## Get Your Mac Ready for iOS Development in 30 Minutes

This is the TL;DR version. For full details, see `MAC-SETUP-COMPLETE.md`.

---

## ⚡ Super Quick Setup (Copy & Paste)

### On Your New Mac:

**Step 1: Download the Setup Script**

```bash
# Open Terminal (Applications > Utilities > Terminal)

# Download and run automated setup
curl -o ~/setup-mac.sh https://raw.githubusercontent.com/joshmeee/claude-templates/main/scripts/mac-setup-script.sh
chmod +x ~/setup-mac.sh
./setup-mac.sh
```

**This script installs:**
- Xcode Command Line Tools
- Homebrew
- Node.js & pnpm
- Git & GitHub CLI
- EAS CLI
- SSH configuration

**Step 2: Manual Steps After Script**

```bash
# 1. Install full Xcode from App Store (30-60 min download)
# Search "Xcode" in App Store, click Install

# 2. Authenticate with GitHub
gh auth login
# Choose: GitHub.com > HTTPS > Yes > Login with browser

# 3. Authenticate with Expo
eas login
# Enter your Expo credentials

# 4. Clone BookLend project
mkdir -p ~/projects
cd ~/projects
gh repo clone joshmeee/booklend
cd booklend
pnpm install
```

**Step 3: Get Your Mac's Connection Info**

```bash
# Run this and save the output:
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "IP Address: $(ipconfig getifaddr en0)"
```

**Give these three pieces of information to Claude for SSH setup!**

---

## 🔗 From Windows: Connect to Your Mac

**Step 1: Download and Run the Windows SSH Setup Script**

```batch
REM Download the script from GitHub:
curl -o %TEMP%\windows-mac-ssh-setup.bat https://raw.githubusercontent.com/joshmeee/claude-templates/main/scripts/windows-mac-ssh-setup.bat

REM Run it:
%TEMP%\windows-mac-ssh-setup.bat
```

**You'll be prompted for:**
- Mac username (from step 3 above)
- Mac IP or hostname (from step 3 above)
- Mac password (one time only)

**Step 2: Test Connection**

```bash
# Should work without password:
ssh booklend-mac

# Test build capability:
ssh booklend-mac "cd ~/projects/booklend && pnpm --version"
```

**Step 3: Configure GitHub Actions**

Add these to GitHub Secrets:
- https://github.com/joshmeee/booklend/settings/secrets/actions

1. `MAC_SSH_KEY` - Contents of `C:\Users\[USERNAME]\.ssh\booklend_mac_key`
2. `MAC_HOST` - Your Mac's IP or hostname
3. `MAC_USER` - Your Mac username

---

## ✅ Verification Checklist

Run these commands to verify everything works:

### On Mac:

```bash
# Check Xcode
xcode-select -p
# Should show: /Applications/Xcode.app/Contents/Developer

# Check Homebrew
brew --version

# Check Node.js
node --version

# Check pnpm
pnpm --version

# Check EAS
eas whoami
# Should show your Expo username

# Check GitHub
gh auth status
# Should show: Logged in to github.com

# Check Remote Login
sudo systemsetup -getremotelogin
# Should show: Remote Login: On

# Check BookLend project
cd ~/projects/booklend && ls
# Should show: apps, packages, firebase.json, etc.
```

### From Windows:

```bash
# SSH connection works
ssh booklend-mac "echo 'Connection successful'"

# Can access BookLend
ssh booklend-mac "cd ~/projects/booklend && pwd"

# Can run pnpm
ssh booklend-mac "cd ~/projects/booklend && pnpm --version"

# Can run EAS
ssh booklend-mac "eas whoami"

# Test iOS build (this will take ~20 min)
ssh booklend-mac "cd ~/projects/booklend/apps/mobile && eas build --platform ios --profile development"
```

---

## 🚀 Daily Usage

### Trigger iOS Build from Windows

**Option 1: Via Git Push (Automatic)**
```bash
# On Windows
cd C:\Users\jelbe\booklend
git add .
git commit -m "feat: new feature"
git push origin master

# GitHub Actions automatically builds iOS on your Mac
```

**Option 2: Via Claude Code**
```
User: "Build iOS app on the Mac"

Claude: [SSHs into Mac and runs iOS build]
```

**Option 3: Manual SSH**
```bash
# From Windows
ssh booklend-mac "cd ~/projects/booklend/apps/mobile && eas build --platform ios"
```

### Check Build Status

```bash
# From Windows
ssh booklend-mac "cd ~/projects/booklend/apps/mobile && eas build:list --platform ios --limit 5"

# Or visit: https://expo.dev
```

---

## 📱 TestFlight Deployment

### After Successful Build:

```bash
# Submit to TestFlight
ssh booklend-mac "cd ~/projects/booklend/apps/mobile && eas submit --platform ios --latest"

# Check submission status
ssh booklend-mac "eas submission:list --platform ios"
```

### Add Testers:

1. Go to App Store Connect
2. TestFlight tab
3. Add testers by email
4. They receive invite
5. Install from TestFlight app

---

## 🔧 Troubleshooting

### Can't SSH into Mac

```bash
# On Mac, check SSH is enabled:
sudo systemsetup -getremotelogin

# Enable if needed:
sudo systemsetup -setremotelogin on

# Check firewall:
# System Settings > Network > Firewall > Allow SSH

# Get current IP:
ipconfig getifaddr en0
```

### Mac Falls Asleep During Builds

```bash
# On Mac, prevent sleep:
sudo pmset -c sleep 0

# Or use caffeinate during build:
caffeinate -s &
```

### Xcode License Not Accepted

```bash
# On Mac:
sudo xcodebuild -license accept
```

### EAS Not Logged In

```bash
# On Mac:
eas login
# Enter Expo credentials
```

### Build Fails

```bash
# Check disk space:
ssh booklend-mac "df -h"

# Check logs:
ssh booklend-mac "cd ~/projects/booklend/apps/mobile && eas build:list --platform ios"

# Clean and retry:
ssh booklend-mac "cd ~/projects/booklend && pnpm clean && pnpm install"
```

---

## 📚 Full Documentation

**Quick References:**
- [Quick Start](https://github.com/joshmeee/claude-templates/blob/main/docs/mac-setup/MAC-QUICK-START.md) (this file)
- [Complete Setup Guide](https://github.com/joshmeee/claude-templates/blob/main/docs/mac-setup/MAC-SETUP-COMPLETE.md)
- [iOS Build Automation](https://github.com/joshmeee/claude-templates/blob/main/docs/mac-setup/IOS-BUILD-AUTOMATION.md)

**Scripts:**
- [Mac Setup Script](https://github.com/joshmeee/claude-templates/blob/main/scripts/mac-setup-script.sh)
- [Windows SSH Setup](https://github.com/joshmeee/claude-templates/blob/main/scripts/windows-mac-ssh-setup.bat)

---

## 🎯 What You Can Now Do

✅ **SSH into Mac from Windows** - No password needed
✅ **Run iOS builds remotely** - via SSH or GitHub Actions
✅ **Auto-deploy on git push** - All platforms including iOS
✅ **Use Mac for any Apple dev** - Xcode, Swift, iOS testing
✅ **Build from anywhere** - Configure Tailscale for remote access
✅ **Claude can control your Mac** - For builds and development

---

## ⏭️ Next Steps

1. **Run first iOS build**
   ```bash
   ssh booklend-mac "cd ~/projects/booklend/apps/mobile && eas build --platform ios"
   ```

2. **Configure TestFlight**
   - Add testers in App Store Connect
   - Set up automatic submissions

3. **Set up Tailscale** (Optional but recommended)
   - Access Mac from anywhere
   - Fixed IP even when traveling

4. **Configure GitHub Actions**
   - Automatic iOS builds on push
   - See [iOS Build Automation](https://github.com/joshmeee/claude-templates/blob/main/docs/mac-setup/IOS-BUILD-AUTOMATION.md)

5. **Test full workflow**
   - Make change on Windows
   - Push to GitHub
   - Watch all platforms build

---

## 💡 Pro Tips

1. **Keep Mac Plugged In** - Prevents sleep during builds
2. **Use Static IP** - Configure in router for consistent access
3. **Set Up Tailscale** - Access Mac from anywhere
4. **Monitor Builds** - Check https://expo.dev for build status
5. **Background Builds** - Use `--no-wait` flag for non-blocking builds

---

## 📞 Quick Help

**Problem:** Can't connect to Mac
**Solution:** Check IP, verify Remote Login is on

**Problem:** Build fails
**Solution:** Check Xcode license, disk space, EAS login

**Problem:** Mac sleeps during build
**Solution:** `sudo pmset -c sleep 0`

**Problem:** Need help
**Solution:** Ask Claude! I can SSH into your Mac and debug.

---

**Setup Time:** ~30 minutes
**First Build:** ~20-30 minutes
**Subsequent Builds:** ~15-20 minutes

**Status:** ⚡ Ready for iOS Development!

---

Created: January 2, 2026