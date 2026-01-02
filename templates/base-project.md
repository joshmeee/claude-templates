# Claude Code Instructions - Base Project Template

## 🎯 Project Overview

[PROJECT_NAME] - [Brief description]

**Tech Stack:**
- [Technology 1]
- [Technology 2]
- [Technology 3]

**Key Features:**
- [Feature 1]
- [Feature 2]
- [Feature 3]

---

## 🚀 Development Workflow

### Quick Start

```bash
# Clone and setup
git clone [REPO_URL]
cd [PROJECT_NAME]
[INSTALL_COMMAND]  # npm install, pnpm install, etc.

# Start development
[DEV_COMMAND]  # npm run dev, pnpm dev, etc.
```

### Making Changes

```bash
# 1. Create feature branch
git checkout -b feature/your-feature-name

# 2. Make changes and test
[TEST_COMMAND]

# 3. Commit and push
git add .
git commit -m "feat: description of changes"
git push origin feature/your-feature-name

# 4. Create pull request
gh pr create --fill
```

---

## 📂 Project Structure

```
[PROJECT_NAME]/
├── src/              # Source code
├── tests/            # Test files
├── docs/             # Documentation
├── .github/          # GitHub workflows
└── README.md         # Project readme
```

---

## 🔧 Development Commands

```bash
# Development
[DEV_COMMAND]         # Start dev server
[BUILD_COMMAND]       # Build for production
[TEST_COMMAND]        # Run tests
[LINT_COMMAND]        # Lint code
[FORMAT_COMMAND]      # Format code
```

---

## 🎨 Code Style Guidelines

### Naming Conventions
- **Files:** kebab-case for files (`user-service.ts`)
- **Classes:** PascalCase (`UserService`)
- **Functions:** camelCase (`getUserById`)
- **Constants:** SCREAMING_SNAKE_CASE (`MAX_RETRIES`)
- **Components:** PascalCase (`UserProfile.tsx`)

### Code Organization
- Keep functions small and focused (< 50 lines)
- Use meaningful variable names
- Add comments for complex logic only
- Prefer composition over inheritance
- Follow DRY (Don't Repeat Yourself)

### Commit Messages

Use conventional commits:
- `feat:` New features
- `fix:` Bug fixes
- `docs:` Documentation changes
- `refactor:` Code refactoring
- `test:` Adding/updating tests
- `chore:` Maintenance tasks

---

## 🤖 Claude Code Agent Workflows

### When Starting Development

**Claude should:**
1. Read the relevant files before making changes
2. Use TodoWrite to track multi-step tasks
3. Run tests after significant changes
4. Ask questions if requirements are unclear

### Preferred Tools Usage

- **File Operations:** Use Read/Edit/Write tools, not bash cat/sed
- **Search:** Use Grep for content, Glob for file patterns
- **Complex Tasks:** Use Task tool with appropriate subagent
- **Exploration:** Use Task tool with Explore subagent

### Code Review Checklist

Before marking tasks complete:
- [ ] Code follows project style guidelines
- [ ] Tests are passing
- [ ] No console.log or debug code left
- [ ] Error handling is appropriate
- [ ] Documentation is updated
- [ ] No security vulnerabilities introduced

---

## 🔐 Security Guidelines

- Never commit secrets or API keys
- Use environment variables for sensitive data
- Validate all user inputs
- Sanitize data before database operations
- Keep dependencies updated
- Follow OWASP security guidelines

---

## 📝 Testing Strategy

### Test Pyramid
- **Unit Tests:** Test individual functions/components
- **Integration Tests:** Test component interactions
- **E2E Tests:** Test complete user flows

### Coverage Goals
- Aim for 80%+ code coverage
- Critical paths should have 100% coverage
- All bug fixes should include regression tests

---

## 🐛 Debugging

### Common Issues

1. **[Common Issue 1]**
   - Symptom: [Description]
   - Solution: [Fix]

2. **[Common Issue 2]**
   - Symptom: [Description]
   - Solution: [Fix]

### Debug Tools
- [Tool 1]: [Usage]
- [Tool 2]: [Usage]

---

## 📚 Documentation

- **API Docs:** [Link or location]
- **Architecture:** [Link or location]
- **Deployment:** [Link or location]

---

## ✅ Definition of Done

A task is complete when:
- [ ] Code is written and tested
- [ ] Tests are passing
- [ ] Code is reviewed
- [ ] Documentation is updated
- [ ] Changes are deployed (if applicable)
- [ ] User story acceptance criteria are met

---

## 🚨 Important Notes for Claude

1. **Always read files before editing** - Never propose changes to unread code
2. **Use TodoWrite for complex tasks** - Break down multi-step work
3. **Ask clarifying questions** - Use AskUserQuestion when uncertain
4. **Run tests after changes** - Verify nothing broke
5. **Keep changes focused** - Don't over-engineer or add unrequested features
6. **Security first** - Watch for OWASP top 10 vulnerabilities
7. **Follow existing patterns** - Match the project's style and architecture

---

**Last Updated:** [DATE]
