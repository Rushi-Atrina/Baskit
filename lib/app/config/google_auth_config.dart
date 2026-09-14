/// Fill these in once the Google Cloud OAuth clients exist — see
/// docs/plan.md "Open Items" / the Google Sign-In setup steps you were given.
///
/// - Android needs NO client ID here: it's identified by package name
///   (`com.example.baskit`) + SHA-1 fingerprint registered as an "Android"
///   OAuth client in Google Cloud Console.
/// - iOS REQUIRES its OAuth client's "iOS client ID" below (bundle ID
///   `com.example.baskit` registered as an "iOS" OAuth client).
class GoogleAuthConfig {
  const GoogleAuthConfig._();

  /// iOS OAuth client ID, e.g. "1234567890-abc.apps.googleusercontent.com".
  /// Leave null until you have it — sign-in will simply fail on iOS with a
  /// clear GoogleSignInException until it's set.
  static const String? iosClientId = null;
}
