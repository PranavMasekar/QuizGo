import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quiz_go/constants/export_constants.dart';

class QuizService {
  final Dio _client;

  QuizService({required Dio client}) : _client = client;

  FutureAppEither<List> loadQuiz(String category) async {
    try {
      const String url = "https://quizapi.io/api/v1/questions";

      final response = await _client.get(
        url,
        queryParameters: {
          "apiKey": "13tmNQnZ9tysUNHRI6X533wej3BOzF0o4ilK6Nee",
          "tags": category,
          "limit": 6,
        },
      );
      log("Response Code From FetchQuiz : ${response.statusCode}");
      return right(response.data);
    } catch (error) {
      log("Error Message in QuizService : $error");
      return left(
        AppError(message: "Something went wrong!"),
      );
    }
  }
}
