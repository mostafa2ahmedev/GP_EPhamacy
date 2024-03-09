class AuthCubitState {}

class InitialAuthState extends AuthCubitState {}

class SuccessAuthState extends AuthCubitState {
  final String user;

  SuccessAuthState({required this.user});
}

class FaulierAuthState extends AuthCubitState {
  final String errorMsg;

  FaulierAuthState({required this.errorMsg});
}
