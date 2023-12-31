import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_go/models/user_model.dart';

void main() {
  final user = UserModel(email: 'someone@gmail.com', userName: 'Someone');
  final userMap = {
    'email': 'someone@gmail.com',
    'userName': 'Someone',
  };

  group(
    'UserModel -',
    () {
      test(
        'should return a valid UserModel instance when the map is valid',
        () {
          expect(UserModel.fromMap(userMap), user);
        },
      );

      test(
        'should return a valid map when the UserModel instance is valid',
        () {
          expect(user.toMap(), userMap);
        },
      );

      test(
        'should return a valid UserModel instance when the copyWith method is called',
        () {
          final expectedUser =
              UserModel(email: 'someone1@gmail.com', userName: 'Someone');
          expect(user.copyWith(email: 'someone1@gmail.com'), expectedUser);
        },
      );
    },
  );
}
