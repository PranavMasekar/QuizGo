import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quiz_go/constants/export_constants.dart';

class QuizService {
  QuizService({required Dio client}) : _client = client;
  final Dio _client;

  FutureAppEither<List> loadProgrammingQuiz(String category) async {
    try {
      const url = 'https://quizapi.io/api/v1/questions';

      final response = await _client.get(
        url,
        queryParameters: {
          'apiKey': '13tmNQnZ9tysUNHRI6X533wej3BOzF0o4ilK6Nee',
          'tags': category,
          'limit': 6,
        },
      );
      log('Response Code From FetchQuiz : ${response.statusCode}');
      if (response.statusCode == 200) {
        return right(response.data);
      } else {
        return left(
          AppError(message: 'Something went wrong!'),
        );
      }
    } catch (error) {
      log('Error Message in QuizService : $error');
      return left(
        AppError(message: 'Something went wrong!'),
      );
    }
  }

  FutureAppEither<List> loadEntertainmentQuizes(int category) async {
    try {
      const url = 'https://opentdb.com/api.php';

      final response = await _client.get(
        url,
        queryParameters: {
          'category': category,
          'difficulty': 'easy',
          'amount': 6,
        },
      );
      log('Response Code From FetchQuiz : ${response.statusCode}');
      if (response.statusCode == 200) {
        return right(response.data['results']);
      } else {
        return left(
          AppError(message: 'Something went wrong!'),
        );
      }
    } catch (error) {
      log('Error Message in QuizService : $error');
      return left(
        AppError(message: 'Something went wrong!'),
      );
    }
  }
}

// General Knowledge - 9 - category - difficulty - easy - amount - 6
// https://opentdb.com/api.php