class Option {
  final String id;
  final String text;

  Option({required this.id, required this.text});

  Option copyWith({
    String? id,
    String? text,
  }) {
    return Option(
      id: id ?? this.id,
      text: text ?? this.text,
    );
  }

  @override
  String toString() => 'Option(id: $id, text: $text)';

  @override
  bool operator ==(covariant Option other) {
    if (identical(this, other)) return true;

    return other.id == id && other.text == text;
  }

  @override
  int get hashCode => id.hashCode ^ text.hashCode;
}
