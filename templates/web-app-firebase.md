# Claude Code Instructions - Web App + Firebase Template

## 🎯 Project Overview

[PROJECT_NAME] - [Brief description]

**Tech Stack:**
- **Frontend:** React + Vite + Tailwind CSS
- **Backend:** Firebase (Auth, Firestore, Functions, Hosting)
- **Build:** Vite bundler
- **Deployment:** Firebase Hosting + GitHub Actions

---

## 🚀 Automated Deployment

### CI/CD Pipeline

**Every `git push` to `main` automatically:**
1. Runs tests and linting
2. Builds production bundle
3. Deploys to Firebase Hosting
4. Updates Firestore security rules
5. Deploys Cloud Functions

### Environment Configuration

**Firebase Project:** `[PROJECT_ID]`

**Live URLs:**
- Production: `https://[PROJECT_ID].web.app`
- Preview: `https://[PROJECT_ID]--pr-[NUMBER].web.app` (auto-created for PRs)

---

## 📂 Project Structure

```
project/
├── src/
│   ├── components/       # React components
│   ├── hooks/           # Custom React hooks
│   ├── services/        # API services
│   ├── utils/           # Utility functions
│   ├── types/           # TypeScript types
│   └── App.tsx          # Main app component
├── functions/           # Firebase Cloud Functions
├── firestore.rules      # Database security rules
├── firebase.json        # Firebase configuration
└── vite.config.ts       # Vite configuration
```

---

## 🔧 Development Commands

```bash
# Install dependencies
npm install

# Start dev server (with Firebase emulators)
npm run dev

# Run tests
npm test

# Build for production
npm run build

# Deploy to Firebase
firebase deploy

# Start Firebase emulators
firebase emulators:start
```

---

## 🔥 Firebase Configuration

### Services Used

**Authentication:**
- Email/Password
- Google OAuth
- [Other providers]

**Firestore Collections:**
- `users` - User profiles
- `[collection]` - [Description]

**Cloud Functions:**
- `[functionName]` - [Description]

**Hosting:**
- Single-page app configuration
- Auto-deploy on push to main

### Security Rules

**Location:** `firestore.rules`

**Key Rules:**
- Users can only read/write their own data
- All writes require authentication
- Validate data schema on write

---

## 🎨 Frontend Architecture

### Component Structure

```
src/components/
├── common/          # Reusable UI components
├── features/        # Feature-specific components
└── layouts/         # Page layouts
```

### State Management

- **Local State:** React useState for component-level state
- **Context:** React Context for shared state
- **Server State:** Custom hooks for Firebase data

### Data Fetching Patterns

```typescript
// Use custom hooks for Firebase queries
const { data, loading, error } = useFirestoreDoc('users', userId);
const { data: items } = useFirestoreCollection('items', 
  where('userId', '==', currentUser.uid)
);
```

---

## 🔐 Environment Variables

### Firebase Config

**Location:** `src/firebase/config.ts`

```typescript
const firebaseConfig = {
  apiKey: import.meta.env.VITE_FIREBASE_API_KEY,
  authDomain: import.meta.env.VITE_FIREBASE_AUTH_DOMAIN,
  projectId: import.meta.env.VITE_FIREBASE_PROJECT_ID,
  // ...
};
```

### Local Development

**File:** `.env.local` (gitignored)

```bash
VITE_FIREBASE_API_KEY=your_key_here
VITE_FIREBASE_AUTH_DOMAIN=your_domain_here
VITE_FIREBASE_PROJECT_ID=your_project_id
```

---

## 🧪 Testing

### Test Structure

```
src/
├── components/
│   └── Button/
│       ├── Button.tsx
│       └── Button.test.tsx
```

### Firebase Emulators

Use emulators for testing:
```bash
firebase emulators:start
```

Emulator ports:
- Firestore: 8080
- Auth: 9099
- Functions: 5001

---

## 🚀 Deployment

### GitHub Actions

**Workflow:** `.github/workflows/deploy.yml`

**Secrets Required:**
- `FIREBASE_TOKEN` - Service account token
- `FIREBASE_SERVICE_ACCOUNT` - Service account JSON

### Manual Deployment

```bash
# Deploy everything
firebase deploy

# Deploy hosting only
firebase deploy --only hosting

# Deploy functions only
firebase deploy --only functions

# Deploy rules only
firebase deploy --only firestore:rules
```

---

## 🤖 Claude Code Guidelines

### Firebase Operations

**When modifying Firestore:**
1. Update security rules in `firestore.rules`
2. Update TypeScript types
3. Test with emulators before deploying
4. Consider migration strategy for existing data

**When adding Cloud Functions:**
1. Follow RESTful patterns for HTTP functions
2. Use TypeScript for type safety
3. Add proper error handling
4. Set appropriate timeouts and memory limits
5. Test with emulators first

### Common Tasks

**Adding a new Firestore collection:**
1. Define TypeScript interface
2. Add security rules
3. Create custom hook for queries
4. Add to Firestore indexes if needed

**Adding authentication:**
1. Enable provider in Firebase Console
2. Add UI component for sign-in
3. Handle auth state changes
4. Protect routes as needed

---

## 🐛 Common Issues

### "Permission Denied" Errors
- Check Firestore security rules
- Verify user is authenticated
- Check Firebase Console for rule violations

### Build Failures
- Clear node_modules and reinstall
- Check for TypeScript errors
- Verify environment variables are set

### Deployment Issues
- Verify Firebase project is set: `firebase use [PROJECT_ID]`
- Check that secrets are configured in GitHub
- Review GitHub Actions logs

---

## 📚 Resources

- **Firebase Console:** https://console.firebase.google.com/project/[PROJECT_ID]
- **Firebase Docs:** https://firebase.google.com/docs
- **Vite Docs:** https://vitejs.dev
- **React Docs:** https://react.dev

---

**Last Updated:** [DATE]
