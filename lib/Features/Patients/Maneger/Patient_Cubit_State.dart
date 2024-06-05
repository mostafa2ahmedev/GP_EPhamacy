class PateintCubitState {}

class PatientLoadingState extends PateintCubitState {}

class PatientSuccessState extends PateintCubitState {}

class PatientFaliureState extends PateintCubitState {
  final String errMsq;

  PatientFaliureState({required this.errMsq});
}

class GetDiseasesLoadingState extends PateintCubitState {}

class GetDiseasesSuccessState extends PateintCubitState {}

class GetDiseasesFailureState extends PateintCubitState {}

class PostPatientDataLoadingState extends PateintCubitState {}

class PostPatientDataSuccessState extends PateintCubitState {}

class PostPatientDataFailureState extends PateintCubitState {}

class AssignMedicineToPrescriptionListt extends PateintCubitState {}
