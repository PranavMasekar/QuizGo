import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_exceptions/mock_exceptions.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/models/user_model.dart';
import 'package:quiz_go/services/auth_service.dart';

void main() {
  late final MockFirebaseAuth mockFirebaseAuth;
  late final FakeFirebaseFirestore fakeFirebaseFirestore;
  late final AuthService authService;

  setUpAll(() {
    mockFirebaseAuth = MockFirebaseAuth();
    fakeFirebaseFirestore = FakeFirebaseFirestore();
    authService = AuthService(
      auth: mockFirebaseAuth,
      firestore: fakeFirebaseFirestore,
    );
  });

  group(
    'Signup Function -',
    () {
      test(
        'should return UserModel on success',
        () async {
          const email = 'someone@gmail.com';
          const password = '123456';
          const userName = 'Someone';

          final expectedUser = UserModel(email: email, userName: userName);

          final result = await authService.signUp(email, password, userName);

          result.fold(
            (error) => expect(error, isA<AppError>()),
            (user) => expect(user, expectedUser),
          );
        },
      );

      test(
        'should return AppError on exception',
        () async {
          const email = 'someone2@gmail.com';
          const password = '123456';
          const userName = 'Someone2';

          whenCalling(
            Invocation.method(#createUserWithEmailAndPassword, null),
          )
              .on(mockFirebaseAuth)
              .thenThrow(FirebaseAuthException(code: 'Random Error'));

          expect(
            () => mockFirebaseAuth.createUserWithEmailAndPassword(
              email: email,
              password: password,
            ),
            throwsA(isA<FirebaseAuthException>()),
          );

          final result = await authService.signUp(email, password, userName);

          result.fold(
            (error) => expect(error, isA<AppError>()),
            (user) => expect(user, isA<UserModel>()),
          );
        },
      );
    },
  );
}
