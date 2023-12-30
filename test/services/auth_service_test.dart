import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_go/models/user_model.dart';
import 'package:quiz_go/services/auth_service.dart';

void main() {
  late final MockFirebaseAuth mockFirebaseAuth;
  late final FakeFirebaseFirestore fakeFirebaseFirestore;
  late final AuthService authService;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    fakeFirebaseFirestore = FakeFirebaseFirestore();
    authService = AuthService(
      auth: mockFirebaseAuth,
      firestore: fakeFirebaseFirestore,
    );
  });

  test(
    'Signup with email and password should return UserModel',
    () async {
      const email = 'someone@gmail.com';
      const password = '123456';
      const userName = 'Someone';

      final user = UserModel(email: email, userName: userName);

      final result = await authService.signUp(email, password, userName);
      final isRight = result.isRight();
      final actualUser = result.toNullable();

      expect(isRight, true);
      expect(actualUser, user);
    },
  );
}
