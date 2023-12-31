import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:quiz_go/models/option_model.dart';

@GenerateMocks([Option])
void main() {
  group('Option toString', () {
    test(
        'should return correct string representation when id and text are non-empty',
        () {
      final option = Option(id: 'testId', text: 'testText');
      expect(option.toString(), 'Option(id: testId, text: testText)');
    });

    test(
        'should return correct string representation when id is empty and text is non-empty',
        () {
      final option = Option(id: '', text: 'testText');
      expect(option.toString(), 'Option(id: , text: testText)');
    });

    test(
        'should return correct string representation when id is non-empty and text is empty',
        () {
      final option = Option(id: 'testId', text: '');
      expect(option.toString(), 'Option(id: testId, text: )');
    });

    test(
        'should return correct string representation when id and text are empty',
        () {
      final option = Option(id: '', text: '');
      expect(option.toString(), 'Option(id: , text: )');
    });

    test(
        'should return correct string representation when id and text contain special characters',
        () {
      final option = Option(id: '@#\$%^&*()', text: '!@#\$%^&*()');
      expect(option.toString(), 'Option(id: @#\$%^&*(), text: !@#\$%^&*())');
    });
  });
}
