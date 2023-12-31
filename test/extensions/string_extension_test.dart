import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_go/extensions/export_extension.dart';

void main() {
  group(
    'String extension -',
    () {
      test(
        'capitalizeFirstLetter should return a string with the first letter capitalized',
        () {
          expect('hello'.capitalizeFirstLetter(), 'Hello');
        },
      );
    },
  );
}
