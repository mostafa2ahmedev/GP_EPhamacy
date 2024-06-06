class AuthCubitState {}

class InitialAuthState extends AuthCubitState {}

class SuccessAuthState extends AuthCubitState {
  final String user;

  SuccessAuthState({required this.user});
}

class AuthLoadingState extends AuthCubitState {}

class FaulierAuthState extends AuthCubitState {
  final String errorMsg;

  FaulierAuthState({required this.errorMsg});
}

class ValidatingTokenLoading extends AuthCubitState {}

class ValidatingTokenSuccess extends AuthCubitState {}

class ValidatingTokenFailed extends AuthCubitState {}
