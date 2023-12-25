import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_go/extensions/export_extension.dart';

void main() {
  final date = DateTime(2023, 4, 2);

  group(
    'Date Extension -',
    () {
      test(
        'toFormatted date should return 02 Apr 2023',
        () {
          expect(date.toFormattedDate(), '02 Apr 2023');
        },
      );

      test(
        'toFormattedDateMonthFirst should return Apr 02 2023',
        () {
          expect(date.toFormattedDateMonthFirst(), 'Apr 02 2023');
        },
      );

      test(
        'toFormattedDateWithSlash should return 02/04/2023',
        () {
          expect(date.toFormattedDateWithSlash(), '02/04/2023');
        },
      );

      test(
        'toFormattedDateWithoutYear should return 02/04',
        () {
          expect(date.toFormattedDateWithoutYear(), '02/04');
        },
      );

      test(
        'toFormattedDateWithMonthName should return 2nd April 2023',
        () {
          expect(date.toFormattedDateWithMonthName(), '2nd April 2023');
        },
      );
    },
  );
}
