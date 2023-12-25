import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_go/models/export_models.dart';

void main() {
  final question = QuestionModel(
    id: 1,
    question: 'Testing question',
    options: [
      Option(id: '1', text: 'Option 1'),
      Option(id: '2', text: 'Option 2'),
      Option(id: '3', text: 'Option 3'),
      Option(id: '4', text: 'Option 4'),
    ],
    correctOption: '2',
  );

  final questionMap = {
    'id': 1,
    'question': 'Testing question',
    'answers': {
      '1': 'Option 1',
      '2': 'Option 2',
      '3': 'Option 3',
      '4': 'Option 4',
    },
    'correct_answers': {
      '1_correct': 'false',
      '2_correct': 'true',
      '3_correct': 'false',
      '4_correct': 'false',
    },
  };

  group(
    'QuestionModel -',
    () {
      test(
        'should return a valid QuestionModel instance when the map is valid',
        () {
          expect(QuestionModel.fromMap(questionMap), question);
        },
      );

      test(
        'should return a valid QuestionModel instance when the copyWith method is called',
        () {
          final expectedQuestion = QuestionModel(
            id: 1,
            question: 'Testing question',
            options: [
              Option(id: '1', text: 'Option 1'),
              Option(id: '2', text: 'Option 2'),
              Option(id: '3', text: 'Option 3'),
              Option(id: '4', text: 'Option 4'),
            ],
            correctOption: '3',
          );
          expect(question.copyWith(correctOption: '3'), expectedQuestion);
        },
      );
    },
  );
}
