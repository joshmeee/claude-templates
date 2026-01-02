# Claude Code Instructions - Fullstack Monorepo Template

## 🎯 Project Overview

[PROJECT_NAME] - Fullstack application in monorepo structure

**Monorepo Stack:**
- **Build System:** Turborepo
- **Package Manager:** pnpm with workspaces
- **Apps:** Web, Mobile, API
- **Shared:** Core logic, types, UI components

**Tech Stack:**
- **Web:** React + Vite + Tailwind CSS
- **Mobile:** React Native + Expo
- **API:** [Express/Fastify/Next.js API/etc.]
- **Database:** [PostgreSQL/MongoDB/Firestore/etc.]
- **Auth:** [Firebase Auth/Auth0/Custom/etc.]

---

## 📂 Monorepo Structure

```
project/
├── apps/
│   ├── web/              # Web application (React + Vite)
│   │   ├── src/
│   │   ├── package.json
│   │   └── vite.config.ts
│   ├── mobile/           # Mobile app (React Native + Expo)
│   │   ├── app/
│   │   ├── package.json
│   │   └── app.json
│   └── api/              # Backend API
│       ├── src/
│       ├── package.json
│       └── tsconfig.json
├── packages/
│   ├── core/             # Shared business logic
│   │   ├── src/
│   │   └── package.json
│   ├── ui/               # Shared UI components
│   │   ├── src/
│   │   └── package.json
│   ├── types/            # Shared TypeScript types
│   │   ├── src/
│   │   └── package.json
│   └── config/           # Shared configuration
│       ├── eslint/
│       ├── typescript/
│       └── package.json
├── turbo.json            # Turborepo configuration
├── pnpm-workspace.yaml   # pnpm workspace config
└── package.json          # Root package.json
```

---

## 🚀 Development Workflow

### Initial Setup

```bash
# Clone repository
git clone [REPO_URL]
cd [PROJECT_NAME]

# Install all dependencies (across all packages)
pnpm install

# Start all apps in development mode
pnpm dev
```

### Working with Specific Apps

```bash
# Web app only
pnpm --filter web dev

# Mobile app only
pnpm --filter mobile dev

# API only
pnpm --filter api dev

# Run multiple apps
pnpm --filter web --filter api dev
```

### Building

```bash
# Build all apps and packages
pnpm build

# Build specific app
pnpm --filter web build
pnpm --filter mobile build
pnpm --filter api build

# Build with dependencies
pnpm --filter web... build  # Builds web and all its dependencies
```

### Testing

```bash
# Run all tests
pnpm test

# Run tests for specific package
pnpm --filter core test
pnpm --filter ui test

# Watch mode
pnpm --filter web test -- --watch
```

---

## 🔧 Turborepo Configuration

### turbo.json Structure

```json
{
  "$schema": "https://turbo.build/schema.json",
  "pipeline": {
    "build": {
      "dependsOn": ["^build"],
      "outputs": ["dist/**", ".next/**", "build/**"]
    },
    "dev": {
      "cache": false,
      "persistent": true
    },
    "test": {
      "dependsOn": ["^build"],
      "outputs": ["coverage/**"]
    },
    "lint": {
      "outputs": []
    },
    "type-check": {
      "dependsOn": ["^build"],
      "outputs": []
    }
  }
}
```

### Pipeline Tasks

- **build:** Builds the package/app and all dependencies first
- **dev:** Runs development server (no caching, persistent)
- **test:** Runs tests after building dependencies
- **lint:** Lints code (can run in parallel)
- **type-check:** TypeScript type checking

---

## 📦 Package Dependencies

### Internal Package References

**In app package.json:**

```json
{
  "name": "web",
  "dependencies": {
    "@repo/core": "workspace:*",
    "@repo/ui": "workspace:*",
    "@repo/types": "workspace:*"
  }
}
```

### Shared Packages

**@repo/core** - Business logic
- API clients
- Data models
- Utilities
- Constants

**@repo/ui** - UI components
- Shared React components
- Design system
- Styling utilities

**@repo/types** - TypeScript types
- API types
- Domain models
- Utility types

**@repo/config** - Configuration
- ESLint configs
- TypeScript configs
- Jest configs

---

## 🎨 Shared UI Components

### Creating Shared Components

**Location:** `packages/ui/src/components/`

```tsx
// packages/ui/src/components/Button.tsx
import { ButtonHTMLAttributes } from 'react';

export interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary';
}

export function Button({ variant = 'primary', ...props }: ButtonProps) {
  return (
    <button
      className={`btn btn-${variant}`}
      {...props}
    />
  );
}
```

### Using in Apps

```tsx
// apps/web/src/App.tsx
import { Button } from '@repo/ui';

export default function App() {
  return <Button variant="primary">Click me</Button>;
}
```

---

## 🔄 Shared Core Logic

### API Clients

**Location:** `packages/core/src/api/`

```typescript
// packages/core/src/api/users.ts
export class UsersAPI {
  constructor(private baseUrl: string) {}
  
  async getUser(id: string) {
    const res = await fetch(`${this.baseUrl}/users/${id}`);
    return res.json();
  }
}
```

### Data Models

**Location:** `packages/core/src/models/`

```typescript
// packages/core/src/models/User.ts
import { IUser } from '@repo/types';

export class User implements IUser {
  constructor(
    public id: string,
    public name: string,
    public email: string
  ) {}
  
  get displayName() {
    return this.name || this.email;
  }
}
```

---

## 🔍 TypeScript Configuration

### Base Config

**Location:** `packages/config/typescript/base.json`

```json
{
  "$schema": "https://json.schemastore.org/tsconfig",
  "compilerOptions": {
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "moduleResolution": "bundler",
    "module": "ESNext",
    "target": "ES2020"
  }
}
```

### App Config (Extending Base)

```json
{
  "extends": "@repo/config/typescript/base.json",
  "compilerOptions": {
    "outDir": "dist",
    "rootDir": "src"
  },
  "include": ["src"],
  "exclude": ["node_modules", "dist"]
}
```

---

## 🧪 Testing Strategy

### Shared Test Utilities

**Location:** `packages/core/src/test-utils/`

```typescript
// packages/core/src/test-utils/setup.ts
export function setupTestEnv() {
  // Common test setup
}

export const mockUser = {
  id: '1',
  name: 'Test User',
  email: 'test@example.com'
};
```

### Using in Tests

```typescript
// apps/web/src/App.test.tsx
import { render } from '@testing-library/react';
import { mockUser } from '@repo/core/test-utils';
import App from './App';

test('renders user name', () => {
  const { getByText } = render(<App user={mockUser} />);
  expect(getByText('Test User')).toBeInTheDocument();
});
```

---

## 🔐 Environment Variables

### Structure

```
apps/
├── web/
│   └── .env.local        # Web-specific env vars
├── mobile/
│   └── .env.local        # Mobile-specific env vars
└── api/
    └── .env.local        # API-specific env vars

.env                      # Shared env vars (gitignored)
.env.example              # Example env file (committed)
```

### Shared Env Config

**Location:** `packages/config/src/env.ts`

```typescript
export const config = {
  apiUrl: process.env.API_URL || 'http://localhost:3000',
  isDev: process.env.NODE_ENV === 'development',
  isProd: process.env.NODE_ENV === 'production',
};
```

---

## 🚢 Deployment

### CI/CD Pipeline

**Deploy all changed apps:**

```yaml
# .github/workflows/deploy.yml
name: Deploy

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: pnpm/action-setup@v2
      - uses: actions/setup-node@v3
      
      # Install dependencies
      - run: pnpm install
      
      # Build all apps
      - run: pnpm build
      
      # Deploy web app
      - run: pnpm --filter web deploy
      
      # Deploy API
      - run: pnpm --filter api deploy
      
      # Build mobile apps
      - run: pnpm --filter mobile build:ios
      - run: pnpm --filter mobile build:android
```

### Deploying Individual Apps

```bash
# Deploy web to Firebase Hosting
pnpm --filter web deploy

# Deploy API to your hosting provider
pnpm --filter api deploy

# Build mobile apps
pnpm --filter mobile build:ios
pnpm --filter mobile build:android
```

---

## 🤖 Claude Code Guidelines

### Working with Monorepo

**When making changes:**

1. **Identify affected packages**
   - Use Explore agent to find dependencies
   - Check which apps import the changed code
   - Use `pnpm why [package]` to see dependents

2. **Update shared packages first**
   - Change types in `@repo/types`
   - Update logic in `@repo/core`
   - Update UI in `@repo/ui`
   - Then update apps

3. **Test across apps**
   - Run tests for all affected packages
   - Test each app that uses the changed code
   - Verify no regressions

4. **Build verification**
   - Run `pnpm build` to ensure everything compiles
   - Check that types are correct across boundaries
   - Verify no circular dependencies

### Adding New Packages

```bash
# Create new package directory
mkdir -p packages/new-package/src

# Create package.json
cd packages/new-package
pnpm init

# Add to workspace (automatic with pnpm-workspace.yaml)
```

### Adding Dependencies

```bash
# Add to specific package
pnpm --filter web add react-query

# Add to all packages
pnpm add -w typescript

# Add dev dependency to specific package
pnpm --filter web add -D vitest
```

---

## 🔄 Common Workflows

### Adding a New Feature

1. **Define types** in `@repo/types`
2. **Implement logic** in `@repo/core`
3. **Create UI** in `@repo/ui` (if shared) or app-specific
4. **Integrate** in web/mobile apps
5. **Add API endpoint** if needed
6. **Write tests** at each layer
7. **Update docs**

### Refactoring Shared Code

1. **Use Plan agent** to design refactoring
2. **Use Explore agent** to find all usages
3. **Update `@repo/core` or `@repo/ui`**
4. **Fix type errors** in dependent apps
5. **Run tests** for all affected packages
6. **Verify builds** pass

### Performance Optimization

1. **Profile** to identify bottlenecks
2. **Optimize shared packages** first (benefits all apps)
3. **Consider code splitting** in apps
4. **Check bundle sizes** with `pnpm build`
5. **Measure impact** across all apps

---

## 📊 Monorepo Benefits

### Code Sharing
- Share types between frontend and backend
- Reuse components across web and mobile
- Common utilities and logic

### Consistency
- Unified TypeScript configuration
- Shared ESLint and Prettier configs
- Consistent code style

### Efficiency
- Install dependencies once
- Build caching with Turborepo
- Run tasks in parallel
- Only test/build changed packages

---

## 🐛 Troubleshooting

### Build Issues

```bash
# Clear all build caches
pnpm clean
rm -rf node_modules
pnpm install

# Rebuild everything
pnpm build
```

### Type Errors Across Packages

```bash
# Type check all packages
pnpm type-check

# Build packages in dependency order
pnpm build
```

### pnpm Workspace Issues

```bash
# Verify workspace configuration
cat pnpm-workspace.yaml

# List all workspace packages
pnpm list -r --depth 0

# Check package dependencies
pnpm why @repo/core
```

---

## 📚 Resources

- **Turborepo Docs:** https://turbo.build/repo/docs
- **pnpm Workspaces:** https://pnpm.io/workspaces
- **Monorepo Best Practices:** https://monorepo.tools

---

**Last Updated:** [DATE]
