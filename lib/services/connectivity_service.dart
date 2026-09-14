import 'package:connectivity_plus/connectivity_plus.dart';

/// Pre-flight check used before Initial Sync / Refresh so we can show
/// "Internet connection required for setup." immediately, without waiting
/// for an HTTP timeout (requirements.md "Error Handling" §No Internet).
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  Future<bool> hasConnection() async {
    final results = await _connectivity.checkConnectivity();
    return results.any((r) => r != ConnectivityResult.none);
  }
}
