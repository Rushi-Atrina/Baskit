import 'package:baskit/data/repositories/auth_repository.dart';
import 'package:baskit/data/local/database.dart';
import 'package:baskit/modules/auth/auth_controller.dart';
import 'package:baskit/modules/auth/auth_view.dart';
import 'package:baskit/services/google_auth_service.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('AuthView shows a Google sign-in button', (tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    addTearDown(Get.reset);

    Get.put<AuthController>(
      AuthController(AuthRepository(db, GoogleAuthService())),
    );

    await tester.pumpWidget(const GetMaterialApp(home: AuthView()));

    expect(find.text('Baskit'), findsOneWidget);
    expect(find.text('Sign in with Google'), findsOneWidget);
  });
}
