class UserModel {
  final String email;
  final String userName;
  UserModel({
    required this.email,
    required this.userName,
  });

  UserModel copyWith({
    String? email,
    String? userName,
  }) {
    return UserModel(
      email: email ?? this.email,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'userName': userName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      userName: map['userName'] as String,
    );
  }

  @override
  String toString() => 'UserModel(email: $email, userName: $userName)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.email == email && other.userName == userName;
  }

  @override
  int get hashCode => email.hashCode ^ userName.hashCode;
}
