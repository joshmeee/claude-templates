# Personal Claude Code Preferences

## 👤 Developer Profile

**Name:** [Your Name]
**GitHub:** [@your-username](https://github.com/your-username)
**Preferred Stack:** [Your preferred technologies]

---

## 🎨 Code Style Preferences

### General Preferences
- **Language:** TypeScript over JavaScript
- **Formatting:** Prettier with [2/4]-space indentation
- **Linting:** ESLint with [strict/recommended] rules
- **Quotes:** [Single/Double] quotes for strings
- **Semicolons:** [Yes/No]

### Naming Conventions
- **Files:** kebab-case (`user-service.ts`)
- **Components:** PascalCase (`UserProfile.tsx`)
- **Functions:** camelCase (`getUserById`)
- **Constants:** SCREAMING_SNAKE_CASE (`MAX_RETRIES`)
- **Interfaces:** [PascalCase with/without 'I' prefix]

### Code Organization
- Keep functions small (< 50 lines preferred)
- One component per file
- Group related functions together
- Use barrel exports (`index.ts`) for cleaner imports

---

## 🛠️ Preferred Tools & Libraries

### Frontend
- **Framework:** [React/Vue/Svelte/etc.]
- **Styling:** [Tailwind/CSS Modules/Styled Components/etc.]
- **State:** [Context/Redux/Zustand/etc.]
- **Forms:** [React Hook Form/Formik/etc.]
- **Data Fetching:** [Custom hooks/SWR/TanStack Query/etc.]

### Backend
- **Platform:** [Firebase/Supabase/Custom/etc.]
- **API:** [REST/GraphQL/tRPC/etc.]
- **Database:** [Firestore/PostgreSQL/MySQL/etc.]
- **Auth:** [Firebase Auth/Auth0/Clerk/etc.]

### Mobile (if applicable)
- **Framework:** [Expo/React Native CLI]
- **Navigation:** [Expo Router/React Navigation]
- **Styling:** [NativeWind/StyleSheet/etc.]

### Build Tools
- **Bundler:** [Vite/Webpack/etc.]
- **Monorepo:** [Turborepo/Nx/Lerna/None]
- **Package Manager:** [pnpm/npm/yarn]

---

## 🤖 Claude Code Behavior Preferences

### Communication Style
- Be concise and direct
- No unnecessary emojis unless I ask
- Focus on technical accuracy
- Explain "why" for important decisions

### Task Handling
- **Always use TodoWrite** for multi-step tasks
- **Read before editing** - Never modify unread code
- **Ask questions** when requirements are unclear
- **Run tests** after significant changes

### Tool Preferences
- Use **Grep** and **Glob** over bash commands for searching
- Use **Read/Edit/Write** tools, not cat/sed/echo
- Use **Task tool with Explore agent** for codebase exploration
- Prefer **parallel tool calls** when possible

### Code Review Standards
- Check for OWASP top 10 vulnerabilities
- Ensure TypeScript types are proper (no `any` unless necessary)
- Verify error handling is appropriate
- Confirm tests are passing
- No console.log in production code

---

## 🚀 Development Workflow Preferences

### Git Workflow
- **Commit Messages:** [Conventional commits/Descriptive/etc.]
- **Branching:** [feature/bugfix/hotfix naming]
- **PR Style:** [Detailed/Concise] descriptions

### Testing Approach
- Write tests for critical paths
- Aim for [80/90/100]%+ coverage
- [Unit/Integration/E2E] tests priority
- Mock external dependencies

### Deployment
- Prefer automated CI/CD over manual deployments
- Use [GitHub Actions/GitLab CI/CircleCI/etc.]
- Staging environment before production
- Feature flags for risky changes

---

## 🔐 Security Preferences

- **Never commit secrets** - Use .env files (gitignored)
- **Validate all inputs** - Especially user-provided data
- **Use environment variables** for API keys and tokens
- **Follow principle of least privilege** - Minimal permissions needed
- **Regular dependency updates** - Keep packages current

---

## 📝 Documentation Preferences

### Code Documentation
- Use JSDoc/TSDoc for public APIs
- Comments should explain "why", not "what"
- Keep README.md updated
- Document complex algorithms

### README Structure
1. Project overview
2. Quick start
3. Installation
4. Usage examples
5. API documentation (if applicable)
6. Contributing guidelines
7. License

---

## 🎯 Project Preferences

### New Projects
- Start with TypeScript template
- Set up ESLint + Prettier immediately
- Configure CI/CD from day one
- Use conventional commits from the start

### File Structure
```
src/
├── components/     # Reusable UI components
├── features/       # Feature-specific code
├── hooks/          # Custom React hooks
├── lib/            # Utilities and helpers
├── services/       # API clients
├── types/          # TypeScript types
└── utils/          # Helper functions
```

---

## 💡 Learning & Improvement

### When I Ask "Why"
- Provide detailed technical explanation
- Include links to documentation
- Explain trade-offs of different approaches

### When Suggesting Solutions
- Offer 2-3 options when multiple approaches exist
- Explain pros/cons of each
- Recommend the best option with reasoning

---

## ⚡ Automation Preferences

### Automate Everything
- Deployments (via CI/CD)
- Testing (run on every commit)
- Linting (pre-commit hooks)
- Dependency updates (Dependabot/Renovate)

### Scripts to Include
- `dev` - Start development server
- `build` - Production build
- `test` - Run all tests
- `lint` - Lint code
- `format` - Format code
- `type-check` - TypeScript checking

---

## 🚨 Things to Avoid

- **Don't over-engineer** - Keep it simple
- **Don't add features I didn't request** - Stay focused
- **Don't skip error handling** - Always handle errors gracefully
- **Don't ignore TypeScript errors** - Fix them, don't bypass
- **Don't use deprecated APIs** - Use modern alternatives
- **Don't create abstractions prematurely** - YAGNI principle

---

## 📚 Reference Resources I Trust

- **TypeScript:** https://www.typescriptlang.org/docs/
- **React:** https://react.dev
- **[Your preferred framework]:** [URL]
- **MDN:** https://developer.mozilla.org

---

**Last Updated:** [DATE]
