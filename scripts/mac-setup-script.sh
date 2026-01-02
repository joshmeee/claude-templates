#!/bin/bash

# Mac Development Environment Setup for Claude Code Remote Access
# Run this script to set up everything automatically

set -e  # Exit on error

echo "======================================"
echo "Mac Development Setup for Claude Code"
echo "======================================"
echo ""

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Error: This script must run on macOS"
    exit 1
fi

# Get system info
echo "System Information:"
echo "  Username: $(whoami)"
echo "  Hostname: $(hostname)"
echo "  Local IP: $(ipconfig getifaddr en0 || echo 'Not connected to network')"
echo ""

# Enable Remote Login
echo "[1/10] Enabling Remote Login (SSH)..."
sudo systemsetup -setremotelogin on
echo "✓ Remote Login enabled"
echo ""

# Configure power settings
echo "[2/10] Configuring power settings..."
sudo pmset -c sleep 0
sudo pmset -c displaysleep 10
sudo pmset -c tcpkeepalive 1
echo "✓ Power settings configured (Mac won't sleep when plugged in)"
echo ""

# Install Xcode Command Line Tools
echo "[3/10] Installing Xcode Command Line Tools..."
if ! xcode-select -p &>/dev/null; then
    xcode-select --install
    echo "⏳ Please complete the Xcode installation dialog..."
    echo "   Press Enter after installation completes..."
    read
    sudo xcodebuild -license accept
else
    echo "✓ Xcode Command Line Tools already installed"
fi
echo ""

# Install Homebrew
echo "[4/10] Installing Homebrew..."
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add to PATH
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    echo "✓ Homebrew already installed ($(brew --version | head -1))"
fi
echo ""

# Install Node.js
echo "[5/10] Installing Node.js..."
if ! command -v node &>/dev/null; then
    brew install node
    echo "✓ Node.js installed ($(node --version))"
else
    echo "✓ Node.js already installed ($(node --version))"
fi
echo ""

# Install pnpm
echo "[6/10] Installing pnpm..."
if ! command -v pnpm &>/dev/null; then
    npm install -g pnpm
    echo "✓ pnpm installed ($(pnpm --version))"
else
    echo "✓ pnpm already installed ($(pnpm --version))"
fi
echo ""

# Install Git
echo "[7/10] Installing Git..."
if ! command -v git &>/dev/null; then
    brew install git
else
    echo "✓ Git already installed ($(git --version))"
fi

# Configure Git
echo "Configuring Git..."
git config --global user.name "Josh" 2>/dev/null || true
git config --global user.email "joshelberg@gmail.com" 2>/dev/null || true
git config --global init.defaultBranch main 2>/dev/null || true
echo "✓ Git configured"
echo ""

# Install GitHub CLI
echo "[8/10] Installing GitHub CLI..."
if ! command -v gh &>/dev/null; then
    brew install gh
    echo "✓ GitHub CLI installed"
else
    echo "✓ GitHub CLI already installed ($(gh --version | head -1))"
fi
echo ""

# Install EAS CLI
echo "[9/10] Installing EAS CLI..."
if ! command -v eas &>/dev/null; then
    npm install -g eas-cli
    echo "✓ EAS CLI installed ($(eas --version))"
else
    echo "✓ EAS CLI already installed ($(eas --version))"
fi
echo ""

# Set up SSH directory
echo "[10/10] Setting up SSH..."
mkdir -p ~/.ssh
chmod 700 ~/.ssh
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
touch ~/.ssh/config
chmod 600 ~/.ssh/config
echo "✓ SSH directory configured"
echo ""

# Create projects directory
mkdir -p ~/projects
echo "✓ Projects directory created"
echo ""

# Set up Claude templates directory
mkdir -p ~/.claude
echo "✓ Claude templates directory created"
echo ""

echo "======================================"
echo "✅ Base Setup Complete!"
echo "======================================"
echo ""
echo "📋 Next Manual Steps:"
echo ""
echo "1. Install full Xcode from App Store (required for iOS builds):"
echo "   - Open App Store"
echo "   - Search 'Xcode'"
echo "   - Install (30-60 minutes)"
echo "   - Open Xcode and accept license"
echo ""
echo "2. Authenticate with GitHub:"
echo "   $ gh auth login"
echo "   Choose: GitHub.com > HTTPS > Yes > Login with browser"
echo ""
echo "3. Authenticate with Expo:"
echo "   $ eas login"
echo "   Enter your Expo credentials"
echo ""
echo "4. Provide these details to Claude for SSH setup:"
echo "   Username: $(whoami)"
echo "   Hostname: $(hostname)"
echo "   Local IP: $(ipconfig getifaddr en0 || echo 'Get IP from System Settings > Network')"
echo ""
echo "5. Claude will then:"
echo "   - Generate SSH keys on Windows"
echo "   - Copy public key to this Mac"
echo "   - Test SSH connection"
echo "   - Configure for remote iOS builds"
echo ""
echo "📡 SSH Access Info:"
echo "  Local: ssh $(whoami)@$(hostname)"
echo "  IP:    ssh $(whoami)@$(ipconfig getifaddr en0 2>/dev/null || echo 'GET_YOUR_IP')"
echo ""
echo "🔐 Remote Login is ENABLED"
echo "💻 Power settings configured for builds"
echo "📁 Ready for project cloning"
echo ""
