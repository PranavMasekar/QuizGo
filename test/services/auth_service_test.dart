import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_go/models/user_model.dart';
import 'package:quiz_go/services/auth_service.dart';

class MockAuthService extends Mock implements AuthService {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    required String? email,
    required String? password,
  }) =>
      super.noSuchMethod(
        Invocation.method(#createUserWithEmailAndPassword, [email, password]),
        returnValue: Future.value(MockUserCredential()),
      );
}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

void main() {
  late final MockAuthService mockAuthService;
  late final MockFirebaseAuth mockFirebaseAuth;
  late final MockUserCredential userCredential;
  late final MockUser mockUser;

  setUp(
    () {
      mockFirebaseAuth = MockFirebaseAuth();
      userCredential = MockUserCredential();
      mockAuthService = MockAuthService();
      mockUser = MockUser();
      when(userCredential.user).thenReturn(mockUser);
    },
  );

  test(
    'should return a user when the sign up is successful',
    () async {
      when(
        mockFirebaseAuth.createUserWithEmailAndPassword(
          email: "someone@gmail.com",
          password: "123456",
        ),
      ).thenAnswer(
        (_) async => userCredential,
      );

      final UserModel user = UserModel(
        email: 'someone@gmail.com',
        userName: 'someone',
      );

      final result = await mockAuthService.signUp(
        'someone@gmail.com',
        '123456',
        'someone',
      );

      expect(result.isRight(), true);
      expect(result.getRight(), user);
    },
  );
}
