import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:quiz_go/models/option_model.dart';

@GenerateMocks([Option])
void main() {
  group('Option copyWith', () {
    test(
        'should return a new Option with the same values when no parameters are passed',
        () {
      final option = Option(id: '1', text: 'Option 1');
      final copiedOption = option.copyWith();

      expect(copiedOption, option);
      expect(copiedOption.id, option.id);
      expect(copiedOption.text, option.text);
    });

    test('should return a new Option with the updated id when id is passed',
        () {
      final option = Option(id: '1', text: 'Option 1');
      final copiedOption = option.copyWith(id: '2');

      expect(copiedOption.id, '2');
      expect(copiedOption.text, option.text);
    });

    test('should return a new Option with the updated text when text is passed',
        () {
      final option = Option(id: '1', text: 'Option 1');
      final copiedOption = option.copyWith(text: 'Option 2');

      expect(copiedOption.id, option.id);
      expect(copiedOption.text, 'Option 2');
    });

    test(
        'should return a new Option with the updated id and text when both are passed',
        () {
      final option = Option(id: '1', text: 'Option 1');
      final copiedOption = option.copyWith(id: '2', text: 'Option 2');

      expect(copiedOption.id, '2');
      expect(copiedOption.text, 'Option 2');
    });
  });
}
