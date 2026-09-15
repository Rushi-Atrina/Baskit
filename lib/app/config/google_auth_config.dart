/// Fill these in once the Google Cloud OAuth clients exist.
///
/// You need THREE OAuth 2.0 Client IDs from the same Google Cloud project
/// (APIs & Services -> Credentials -> Create Credentials -> OAuth client ID):
///
/// 1. **Android** client — package name `com.example.baskit` + your
///    keystore's SHA-1. Used only for Google to verify the app; its ID is
///    never referenced in code.
/// 2. **iOS** client — bundle ID `com.example.baskit`. Its Client ID goes
///    in [iosClientId] below.
/// 3. **Web application** client — no redirect URI needed for this use
///    case, just create it. Its Client ID goes in [webClientId] below AND
///    is required on Android too (passed as `serverClientId`) — Android's
///    Credential Manager sign-in doesn't work from the Android client
///    registration alone.
class GoogleAuthConfig {
  const GoogleAuthConfig._();

  /// The "Web application" OAuth client's ID. Required for Android.
  static const String? webClientId =
      '316041812030-d2gqo8j0d4u3fcp562e90ovvorgcofed.apps.googleusercontent.com';

  /// The "iOS" OAuth client's ID. Required for iOS.
  static const String? iosClientId =
      '316041812030-ornq1vmj902mq3m5d8j4anmcii89gp72.apps.googleusercontent.com';
}
