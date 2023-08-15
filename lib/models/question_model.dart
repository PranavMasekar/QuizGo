import 'package:flutter/foundation.dart';
import 'package:quiz_go/models/export_models.dart';

class QuestionModel {
  final int id;
  final String question;
  final List<Option> options;
  final String correctOption;
  QuestionModel({
    required this.id,
    required this.question,
    required this.options,
    required this.correctOption,
  });

  QuestionModel copyWith({
    int? id,
    String? question,
    List<Option>? options,
    String? correctOption,
  }) {
    return QuestionModel(
      id: id ?? this.id,
      question: question ?? this.question,
      options: options ?? this.options,
      correctOption: correctOption ?? this.correctOption,
    );
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    List<Option> options = [];
    map["answers"].forEach((key, value) {
      if (value != null) {
        options.add(Option(id: key, text: value));
      }
    });

    String correctOptionKey = '';
    map["correct_answers"].forEach((key, value) {
      if (value == "true") {
        correctOptionKey = key;
        return;
      }
    });

    return QuestionModel(
      id: map['id'] as int,
      question: map['question'] as String,
      options: options,
      correctOption: correctOptionKey.replaceAll('_correct', ''),
    );
  }

  @override
  String toString() {
    return 'QuestionModel(id: $id, question: $question, options: $options, correctOptions: $correctOption)';
  }

  @override
  bool operator ==(covariant QuestionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.question == question &&
        other.correctOption == correctOption &&
        listEquals(other.options, options);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        question.hashCode ^
        options.hashCode ^
        correctOption.hashCode;
  }
}
