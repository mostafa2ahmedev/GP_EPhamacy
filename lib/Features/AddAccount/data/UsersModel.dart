class Users {
  final String userName;
  final String password;
  final String authority;
  final String phone;
  final String name;
  final String nationalId;

  Users(
      {required this.userName,
      required this.password,
      required this.authority,
      required this.phone,
      required this.name,
      required this.nationalId});

  Map<String, dynamic> toJson({required Users user}) {
    return {
      'name': user.name,
      'userName': user.userName,
      'password': user.password,
      'authority': user.authority,
      'phone': user.phone,
      'nationalId': user.nationalId,
      // Add other fields
    };
  }
}
