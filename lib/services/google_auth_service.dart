import 'dart:io' show Platform;

import 'package:google_sign_in/google_sign_in.dart';

import '../app/config/google_auth_config.dart';

/// Thin wrapper around google_sign_in v7's instance/stream API
/// (requirements.md §1). Drift's Users table — not this service — is the
/// source of truth for "is the user logged in", so the app stays usable
/// offline; this is only consulted during the interactive Login action.
class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _initialized = false;

  Future<void> ensureInitialized() async {
    if (_initialized) return;
    await _googleSignIn.initialize(
      clientId: Platform.isIOS ? GoogleAuthConfig.iosClientId : null,
      // Required on Android (Credential Manager sign-in needs the Web
      // client's ID, not just the Android client's SHA-1 registration).
      serverClientId: GoogleAuthConfig.webClientId,
    );
    _initialized = true;
  }

  /// Interactive sign-in. Throws [GoogleSignInException] on cancellation or
  /// failure — the caller (AuthRepository/AuthController) decides how to
  /// surface that.
  Future<GoogleSignInAccount> signIn() async {
    await ensureInitialized();
    return _googleSignIn.authenticate();
  }

  Future<void> signOut() async {
    await ensureInitialized();
    await _googleSignIn.signOut();
  }
}
