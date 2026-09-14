import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../app/routes/app_routes.dart';
import '../../data/repositories/auth_repository.dart';

class AuthController extends GetxController {
  AuthController(this._authRepository);

  final AuthRepository _authRepository;

  final isLoading = false.obs;
  final RxnString errorMessage = RxnString();

  Future<void> loginWithGoogle() async {
    if (isLoading.value) return;

    isLoading.value = true;
    errorMessage.value = null;
    try {
      await _authRepository.signIn();
      Get.offAllNamed(Routes.sync);
    } on GoogleSignInException catch (e) {
      // User-cancelled is not an error — just let them try again silently.
      if (e.code != GoogleSignInExceptionCode.canceled) {
        errorMessage.value = 'Something went wrong. Please try again.';
      }
    } catch (_) {
      errorMessage.value = 'Something went wrong. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }
}
