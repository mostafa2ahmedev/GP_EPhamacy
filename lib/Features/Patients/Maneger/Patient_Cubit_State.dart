class PateintCubitState {}

class PatientLoadingState extends PateintCubitState {}

class PatientSuccessState extends PateintCubitState {}

class PatientSearchingState extends PateintCubitState {}

class PatientFaliureState extends PateintCubitState {
  final String errMsq;

  PatientFaliureState({required this.errMsq});
}
