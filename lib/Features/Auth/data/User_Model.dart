class UserModel {
  final String name;
  final String token;

  UserModel({required this.name, required this.token});

  factory UserModel.fromJson(json) {
    return UserModel(name: json['username'], token: json['token']);
  }
}
