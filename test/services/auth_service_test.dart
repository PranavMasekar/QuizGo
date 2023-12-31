import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_exceptions/mock_exceptions.dart';
import 'package:quiz_go/constants/error.dart';
import 'package:quiz_go/models/user_model.dart';
import 'package:quiz_go/services/auth_service.dart';

void main() {
  const email = 'someone@gmail.com';
  const password = '123456';
  const userName = 'Someone';

  late final MockFirebaseAuth mockFirebaseAuth;
  late final FakeFirebaseFirestore fakeFirebaseFirestore;
  late final AuthService authService;
  final expectedUser = UserModel(email: email, userName: userName);

  setUpAll(() {
    mockFirebaseAuth = MockFirebaseAuth();
    fakeFirebaseFirestore = FakeFirebaseFirestore();
    authService = AuthService(
      auth: mockFirebaseAuth,
      firestore: fakeFirebaseFirestore,
    );
  });

  group(
    'saveToFirestore -',
    () {
      test(
        'should return true after saving data',
        () async {
          await authService.signUp(email, password, userName);
          final result = await authService.saveToFirestore(
            {'email': email, 'userName': userName},
          );

          final isRight = result.isRight();
          expect(isRight, true);

          final isSuccess = result.toNullable();
          expect(isSuccess, true);

          final error = result.getLeft().toNullable();
          expect(error, null);
        },
      );

      test(
        'should return AppError on exception',
        () async {
          await authService.signUp(email, password, userName);
          final uid = mockFirebaseAuth.currentUser!.uid;
          final doc = fakeFirebaseFirestore.collection('users').doc(uid);
          whenCalling(
            Invocation.method(#set, null),
          ).on(doc).thenThrow(FirebaseException(plugin: 'firestore'));

          expect(
            () => doc.set(
              {'email': email, 'userName': userName},
            ),
            throwsA(isA<FirebaseException>()),
          );

          final result = await authService.saveToFirestore(
            {'email': email, 'userName': userName},
          );

          final isLeft = result.isLeft();
          expect(isLeft, true);

          final error = result.getLeft().toNullable();
          expect(error, isA<AppError>());
        },
      );
    },
  );

  group(
    'Signup Function -',
    () {
      test(
        'should return UserModel on success',
        () async {
          final result = await authService.signUp(email, password, userName);

          final isRight = result.isRight();
          expect(isRight, true);

          final user = result.toNullable();
          expect(user, expectedUser);

          final error = result.getLeft().toNullable();
          expect(error, null);
        },
      );

      test(
        'should return AppError on exception',
        () async {
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

          final isLeft = result.isLeft();
          expect(isLeft, true);

          final error = result.getLeft().toNullable();
          expect(error, isA<AppError>());
        },
      );
    },
  );

  group(
    'Login Function -',
    () {
      test(
        'should return userID on success',
        () async {
          final result = await authService.login(email, password);

          final isRight = result.isRight();
          expect(isRight, true);

          final uid = result.toNullable();
          expect(uid, isA<String>());

          final error = result.getLeft().toNullable();
          expect(error, null);
        },
      );

      test(
        'should return AppError on exception',
        () async {
          whenCalling(
            Invocation.method(#signInWithEmailAndPassword, null),
          )
              .on(mockFirebaseAuth)
              .thenThrow(FirebaseAuthException(code: 'Random Error'));

          expect(
            () => mockFirebaseAuth.signInWithEmailAndPassword(
              email: email,
              password: password,
            ),
            throwsA(isA<FirebaseAuthException>()),
          );

          final result = await authService.login(email, password);

          final isLeft = result.isLeft();
          expect(isLeft, true);

          final error = result.getLeft().toNullable();
          expect(error, isA<AppError>());
        },
      );
    },
  );

  group(
    'SignOut Function -',
    () {
      test(
        'should return true on success',
        () async {
          final result = await authService.signOut();

          final isRight = result.isRight();
          expect(isRight, true);

          final isSuccess = result.toNullable();
          expect(isSuccess, true);

          final error = result.getLeft().toNullable();
          expect(error, null);
        },
      );
    },
  );
}
