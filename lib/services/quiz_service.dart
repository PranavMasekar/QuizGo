import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quiz_go/constants/export_constants.dart';

class QuizService {

  QuizService({required Dio client}) : _client = client;
  final Dio _client;

  FutureAppEither<List> loadQuiz(String category) async {
    try {
      const url = 'https://quizapi.io/api/v1/questions';

      final response = await _client.get(
        url,
        queryParameters: {
          'apiKey': '13tmNQnZ9tysUNHRI6X533wej3BOzF0o4ilK6Nee',
          'tags': category,
          'limit': 10,
        },
      );
      log('Response Code From FetchQuiz : ${response.statusCode}');
      return right(response.data);
    } catch (error) {
      log('Error Message in QuizService : $error');
      return left(
        AppError(message: 'Something went wrong!'),
      );
    }
  }
}
