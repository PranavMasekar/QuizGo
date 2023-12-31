import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:quiz_go/constants/error.dart';
import 'package:quiz_go/services/quiz_service.dart';

void main() {
  const quizApiUrl = 'https://quizapi.io/api/v1/questions';
  const openTDBUrl = 'https://opentdb.com/api.php';
  const quizApiQueryParam = {
    'apiKey': '13tmNQnZ9tysUNHRI6X533wej3BOzF0o4ilK6Nee',
    'tags': 'Programming',
    'limit': 6,
  };
  const openTDBQueryParam = {
    'category': 9,
    'difficulty': 'easy',
    'amount': 6,
  };
  late QuizService quizService;
  late Dio dio;
  late DioAdapter dioAdapter;

  setUpAll(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    quizService = QuizService(client: dio);
  });

  group(
    'Fetch Quizes from quizapi.io -',
    () {
      test(
        'should return List of Quizes when the response code is 200',
        () async {
          dioAdapter.onGet(
            quizApiUrl,
            queryParameters: quizApiQueryParam,
            (server) {
              return server.reply(
                200,
                [
                  {
                    "id": 308,
                    "question":
                        "Which licensing authority is responsible for WordPress?",
                    "description": null,
                    "answers": {
                      "answer_a": "GPLv2 (GNU General Public License)",
                      "answer_b": "MIT license",
                      "answer_c": "GPU",
                      "answer_d": "GWPL",
                      "answer_e": null,
                      "answer_f": null
                    },
                    "multiple_correct_answers": "false",
                    "correct_answers": {
                      "answer_a_correct": "true",
                      "answer_b_correct": "false",
                      "answer_c_correct": "false",
                      "answer_d_correct": "false",
                      "answer_e_correct": "false",
                      "answer_f_correct": "false"
                    },
                    "correct_answer": "answer_a",
                    "explanation": null,
                    "tip": null,
                    "tags": [
                      {"name": "WordPress"}
                    ],
                    "category": "CMS",
                    "difficulty": "Medium"
                  },
                ],
              );
            },
          );

          final result = await quizService.loadProgrammingQuiz('Programming');

          final isRight = result.isRight();
          expect(isRight, true);

          final isSuccess = result.toNullable();
          expect(isSuccess, isA<List>());

          final error = result.getLeft().toNullable();
          expect(error, null);
        },
      );

      test(
        'should return AppError when the response code is not 200',
        () async {
          dioAdapter.onGet(
            quizApiUrl,
            queryParameters: quizApiQueryParam,
            (server) {
              return server.reply(
                400,
                'Something went wrong!',
              );
            },
          );

          final result = await quizService.loadProgrammingQuiz('Programming');

          final isLeft = result.isLeft();
          expect(isLeft, true);

          final error = result.getLeft().toNullable();
          expect(error, isA<AppError>());
        },
      );
    },
  );

  group(
    'Fetch Quizes from opentdb.com -',
    () {
      test(
        'should return List of Quizes when the response code is 200',
        () async {
          dioAdapter.onGet(
            openTDBUrl,
            queryParameters: openTDBQueryParam,
            (server) {
              return server.reply(
                200,
                {
                  "response_code": 0,
                  "results": [
                    {
                      "type": "multiple",
                      "difficulty": "easy",
                      "category": "General Knowledge",
                      "question":
                          "What is the closest planet to our solar system&#039;s sun?",
                      "correct_answer": "Mercury",
                      "incorrect_answers": ["Mars", "Jupiter", "Earth"]
                    },
                  ],
                },
              );
            },
          );

          final result = await quizService.loadEntertainmentQuizes(9);

          final isRight = result.isRight();
          expect(isRight, true);

          final isSuccess = result.toNullable();
          expect(isSuccess, isA<List>());

          final error = result.getLeft().toNullable();
          expect(error, null);
        },
      );

      test(
        'should return AppError when the response code is not 200',
        () async {
          dioAdapter.onGet(
            openTDBUrl,
            queryParameters: openTDBQueryParam,
            (server) {
              return server.reply(
                400,
                'Something went wrong!',
              );
            },
          );

          final result = await quizService.loadEntertainmentQuizes(9);

          final isLeft = result.isLeft();
          expect(isLeft, true);

          final error = result.getLeft().toNullable();
          expect(error, isA<AppError>());
        },
      );
    },
  );
}
