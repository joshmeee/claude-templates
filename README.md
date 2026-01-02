# Claude Code Templates

Reusable Claude Code configuration templates and project scaffolding for supercharged AI-assisted development.

## 🎯 Purpose

This repository contains carefully crafted `CLAUDE.md` templates that help Claude Code understand your project structure, coding conventions, and workflows. These templates significantly improve Claude's ability to assist with development tasks.

## 📚 Available Templates

### Core Templates

- **`templates/base-project.md`** - Foundation template for any project type
  - Code style guidelines
  - Development workflow
  - Testing strategy
  - Security best practices

- **`templates/web-app-firebase.md`** - Web apps with Firebase backend
  - React + Vite + Tailwind CSS
  - Firebase (Auth, Firestore, Functions, Hosting)
  - CI/CD with GitHub Actions
  - Automated deployments

- **`templates/mobile-expo.md`** - Mobile apps with Expo
  - React Native + Expo
  - EAS Build for iOS/Android
  - Expo Router navigation
  - NativeWind styling

### Specialized Templates

- **`templates/fullstack-monorepo.md`** - Full-stack monorepo projects
  - Web + Mobile + API in one repo
  - Shared packages
  - Turborepo/pnpm workspaces

- **`templates/ai-agent-workflows.md`** - Advanced Claude Code automation
  - Custom agent definitions
  - Sub-agent orchestration
  - Task automation patterns

## 🚀 Quick Start

### Option 1: Project-Level (Recommended for Teams)

```bash
# In your project directory
curl -o CLAUDE.md https://raw.githubusercontent.com/joshmeee/claude-templates/main/templates/[TEMPLATE_NAME].md

# Edit placeholders
# [PROJECT_NAME], [REPO_URL], etc.

# Commit to version control
git add CLAUDE.md
git commit -m "Add Claude Code configuration"
```

### Option 2: User-Level (Personal Preferences)

```bash
# Create user-level config directory
mkdir -p ~/.claude/templates

# Download template
curl -o ~/.claude/CLAUDE.md https://raw.githubusercontent.com/joshmeee/claude-templates/main/templates/base-project.md

# This applies to ALL projects on your machine
```

### Option 3: Hybrid (Best of Both)

```bash
# User-level: Personal preferences
curl -o ~/.claude/personal.md https://raw.githubusercontent.com/joshmeee/claude-templates/main/templates/personal-preferences.md

# Project-level: Project-specific config
curl -o ./CLAUDE.md https://raw.githubusercontent.com/joshmeee/claude-templates/main/templates/web-app-firebase.md

# In project CLAUDE.md, import personal preferences:
# @~/.claude/personal.md
```

## 📂 Template Structure

Each template includes:

### 🎯 Project Overview
- Tech stack documentation
- Architecture overview
- Key features and goals

### 🚀 Development Workflow
- Setup instructions
- Common commands
- Git workflow
- CI/CD pipeline

### 📂 Project Structure
- Directory layout
- File organization
- Module boundaries

### 🎨 Code Style Guidelines
- Naming conventions
- Code organization
- Best practices
- Commit message format

### 🤖 Claude Code Agent Instructions
- How Claude should work with your code
- Preferred tools and workflows
- Common tasks and patterns
- Code review checklist

### 🧪 Testing Strategy
- Test structure
- Coverage goals
- Testing tools

### 🐛 Debugging & Troubleshooting
- Common issues and solutions
- Debug tools and techniques

## 🔄 Syncing Across Machines

### Cloud Sync (Recommended)

```bash
# Move ~/.claude to cloud-synced folder
mv ~/.claude ~/Dropbox/.claude
ln -s ~/Dropbox/.claude ~/.claude

# Or use OneDrive, iCloud, etc.
```

### Git-Based Sync

```bash
# Create dotfiles repo
git init ~/.claude
cd ~/.claude
git add .
git commit -m "Initial claude config"
git remote add origin git@github.com:yourusername/claude-config.git
git push -u origin main

# On other machines
git clone git@github.com:yourusername/claude-config.git ~/.claude
```

## 🎨 Customization

### Placeholders to Replace

All templates use these placeholders:
- `[PROJECT_NAME]` - Your project name
- `[REPO_URL]` - GitHub repository URL
- `[PROJECT_ID]` - Firebase/Cloud project ID
- `[INSTALL_COMMAND]` - npm/pnpm/yarn install
- `[DEV_COMMAND]` - Development server command
- `[BUILD_COMMAND]` - Build command
- `[TEST_COMMAND]` - Test command
- `[DATE]` - Last updated date

### Adding Custom Sections

Extend templates with project-specific sections:
```markdown
## 🔧 Custom Integrations

### Third-Party Services
- Stripe for payments
- SendGrid for emails
- AWS S3 for storage
```

## 🤖 Advanced: Agent Workflows

See `templates/ai-agent-workflows.md` for:
- Creating custom agents
- Sub-agent orchestration
- Automated task pipelines
- MCP server integration

## 📖 Best Practices

### 1. Keep Templates Updated
- Update when architecture changes
- Document new patterns and conventions
- Add common issues as you encounter them

### 2. Use Version Control
- Commit CLAUDE.md to your project repo
- Track changes over time
- Share with team members

### 3. Layer Your Configuration
```
~/.claude/CLAUDE.md          # Personal preferences (all projects)
./CLAUDE.md                  # Project-specific (committed to git)
./CLAUDE.local.md            # Local overrides (gitignored)
```

### 4. Import Shared Standards
```markdown
# In project CLAUDE.md
@~/.claude/company-standards.md
@~/.claude/personal-preferences.md

# Project-specific content below
```

## 🔗 Integration with MCP Servers

Templates work seamlessly with:
- **GitHub MCP** - Repository operations
- **Filesystem MCP** - File syncing
- **Custom MCP servers** - Project-specific tools

See `docs/mcp-integration.md` for details.

## 🤝 Contributing

Contributions welcome! Please:
1. Fork this repository
2. Create a feature branch
3. Add/improve templates
4. Submit a pull request

## 📄 License

MIT License - feel free to use and modify for your projects.

## 🙏 Credits

Created by [Josh](https://github.com/joshmeee) for the developer community.

Based on real-world experience with Claude Code across multiple projects.

---

**Questions or suggestions?** [Open an issue](https://github.com/joshmeee/claude-templates/issues)
