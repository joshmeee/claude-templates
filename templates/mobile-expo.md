# Claude Code Instructions - Mobile App (Expo) Template

## 🎯 Project Overview

[PROJECT_NAME] - [Brief description]

**Tech Stack:**
- **Framework:** React Native + Expo
- **Build:** EAS Build
- **Navigation:** Expo Router
- **Styling:** NativeWind (Tailwind for React Native)
- **Backend:** [Firebase/Supabase/Custom API]

---

## 🚀 Development Workflow

### Quick Start

```bash
# Install dependencies
npm install

# Start development server
npx expo start

# Scan QR code with Expo Go app on your device
```

### Development Options

```bash
# Start with specific platform
npx expo start --ios      # iOS simulator
npx expo start --android  # Android emulator
npx expo start --web      # Web browser

# Clear cache
npx expo start --clear
```

---

## 📱 Build & Deploy

### EAS Build Setup

```bash
# Install EAS CLI
npm install -g eas-cli

# Login to Expo
eas login

# Configure project
eas build:configure
```

### Building Apps

```bash
# Build for development
eas build --platform ios --profile development
eas build --platform android --profile development

# Build for production
eas build --platform ios --profile production
eas build --platform android --profile production

# Build both platforms
eas build --platform all
```

### Automated Builds (GitHub Actions)

**Every push to `main` triggers:**
1. iOS build → TestFlight (if configured)
2. Android build → Internal testing

**Required Secrets:**
- `EXPO_TOKEN` - Expo account token

---

## 📂 Project Structure

```
app/
├── (tabs)/              # Tab navigation screens
├── (auth)/              # Authentication screens
├── _layout.tsx          # Root layout
└── index.tsx            # Home screen

components/              # Reusable components
├── ui/                  # UI components
└── features/            # Feature components

lib/                     # Utilities and services
├── api/                 # API client
├── hooks/               # Custom hooks
└── utils/               # Helper functions

assets/                  # Images, fonts, etc.
```

---

## 🎨 Styling with NativeWind

### Component Styling

```tsx
import { View, Text } from 'react-native';

export default function Card() {
  return (
    <View className="bg-white rounded-lg p-4 shadow-md">
      <Text className="text-xl font-bold">Title</Text>
      <Text className="text-gray-600">Description</Text>
    </View>
  );
}
```

### Platform-Specific Styles

```tsx
<View className="ios:pt-4 android:pt-2">
  <Text>Platform-specific padding</Text>
</View>
```

---

## 🧭 Navigation (Expo Router)

### File-Based Routing

```
app/
├── index.tsx           → /
├── about.tsx           → /about
├── user/[id].tsx       → /user/:id
└── (tabs)/
    ├── home.tsx        → /home (tab)
    └── profile.tsx     → /profile (tab)
```

### Navigation Examples

```tsx
import { router } from 'expo-router';

// Navigate to screen
router.push('/about');
router.push(`/user/${userId}`);

// Go back
router.back();

// Replace current screen
router.replace('/login');
```

---

## 🔐 Environment Variables

### Configuration

**File:** `app.config.js` (for Expo)

```javascript
export default {
  expo: {
    extra: {
      apiUrl: process.env.API_URL,
      apiKey: process.env.API_KEY,
    },
  },
};
```

### Usage in Code

```typescript
import Constants from 'expo-constants';

const apiUrl = Constants.expoConfig?.extra?.apiUrl;
```

### Local Development

**File:** `.env` (gitignored)

```bash
API_URL=https://api.example.com
API_KEY=your_key_here
```

---

## 📱 Platform-Specific Code

### Platform Detection

```typescript
import { Platform } from 'react-native';

if (Platform.OS === 'ios') {
  // iOS-specific code
}

if (Platform.OS === 'android') {
  // Android-specific code
}

const value = Platform.select({
  ios: 10,
  android: 15,
  default: 12,
});
```

### Platform-Specific Files

```
Button.ios.tsx    # Used on iOS
Button.android.tsx # Used on Android
Button.tsx        # Fallback
```

---

## 🧪 Testing

### Unit Tests (Jest)

```bash
# Run tests
npm test

# Watch mode
npm test -- --watch

# Coverage
npm test -- --coverage
```

### E2E Tests (Detox)

```bash
# Build app for testing
detox build --configuration ios.sim.debug

# Run tests
detox test --configuration ios.sim.debug
```

---

## 📦 Native Modules

### Common Expo Modules

```bash
# Camera
npx expo install expo-camera

# Location
npx expo install expo-location

# Image picker
npx expo install expo-image-picker

# Notifications
npx expo install expo-notifications

# Secure storage
npx expo install expo-secure-store
```

### Usage Example

```typescript
import * as ImagePicker from 'expo-image-picker';

const pickImage = async () => {
  const result = await ImagePicker.launchImageLibraryAsync({
    mediaTypes: ImagePicker.MediaTypeOptions.Images,
    allowsEditing: true,
    quality: 1,
  });
  
  if (!result.canceled) {
    setImage(result.assets[0].uri);
  }
};
```

---

## 🚀 App Store Deployment

### iOS (TestFlight)

```bash
# Build for App Store
eas build --platform ios --profile production

# Submit to App Store
eas submit --platform ios
```

**Requirements:**
- Apple Developer account ($99/year)
- App Store Connect app created
- Provisioning profiles configured

### Android (Google Play)

```bash
# Build for Play Store
eas build --platform android --profile production

# Submit to Play Store
eas submit --platform android
```

**Requirements:**
- Google Play Developer account ($25 one-time)
- App created in Play Console
- Signing key configured

---

## 🤖 Claude Code Guidelines

### React Native Best Practices

1. **Use Expo modules when possible** - Better maintained and cross-platform
2. **Optimize images** - Use appropriate image sizes and formats
3. **Handle permissions properly** - Request before using features
4. **Test on both platforms** - iOS and Android behave differently
5. **Use TypeScript** - Catch errors before runtime

### Performance Considerations

- Use `FlatList` for long lists (not `ScrollView`)
- Memoize components with `React.memo`
- Use `useMemo` and `useCallback` for expensive operations
- Optimize images with `expo-image`
- Avoid inline function definitions in render

### Common Tasks

**Adding a new screen:**
1. Create file in `app/` directory
2. Export default component
3. Navigation automatically works

**Adding native functionality:**
1. Check if Expo module exists first
2. Install with `npx expo install [package]`
3. Request permissions in code
4. Test on both platforms

---

## 🐛 Common Issues

### Metro Bundler Errors
```bash
# Clear cache
npx expo start --clear
rm -rf node_modules && npm install
```

### Build Failures
- Check EAS build logs
- Verify app.json configuration
- Check for platform-specific issues

### Expo Go Limitations
- Some native modules don't work in Expo Go
- Use development build: `eas build --profile development`

---

## 📚 Resources

- **Expo Docs:** https://docs.expo.dev
- **React Native Docs:** https://reactnative.dev
- **EAS Build:** https://docs.expo.dev/build/introduction
- **Expo Router:** https://docs.expo.dev/router/introduction

---

**Last Updated:** [DATE]
