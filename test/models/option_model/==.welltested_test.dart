import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:quiz_go/models/option_model.dart';

@GenerateMocks([Option])
void main() {
  group('Option', () {
    test('should return true when two options are identical', () {
      final option1 = Option(id: '1', text: 'Option 1');
      expect(option1 == option1, true);
    });

    test('should return true when two options have same id and text', () {
      final option1 = Option(id: '1', text: 'Option 1');
      final option2 = Option(id: '1', text: 'Option 1');
      expect(option1 == option2, true);
    });

    test('should return false when two options have different ids', () {
      final option1 = Option(id: '1', text: 'Option 1');
      final option2 = Option(id: '2', text: 'Option 1');
      expect(option1 == option2, false);
    });

    test('should return false when two options have different texts', () {
      final option1 = Option(id: '1', text: 'Option 1');
      final option2 = Option(id: '1', text: 'Option 2');
      expect(option1 == option2, false);
    });

    test('should return false when one option is null', () {
      final option1 = Option(id: '1', text: 'Option 1');
      Option? option2;
      expect(option1 == option2, false);
    });
  });
}
