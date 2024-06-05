class Users {
  final String username;
  final String password;
  final String authority;
  final int phone;
  final String name;
  final String nationalId;

  Users(
      {required this.username,
      required this.password,
      required this.authority,
      required this.phone,
      required this.name,
      required this.nationalId});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'password': password,
      'authority': authority,
      'phone': phone,
      'nationalId': nationalId,
    };
  }
}
