abstract class DispensingMedicationsState {}

class DispensingMedicationsInitial extends DispensingMedicationsState {}

class GetPrescriptionDataLoadingState extends DispensingMedicationsState {}

class GetPrescriptionDataFailureState extends DispensingMedicationsState {}

class GetPrescriptionDataSuccessState extends DispensingMedicationsState {}

class GetPrescriptionDataForSaleLoadingState
    extends DispensingMedicationsState {}

class GetPrescriptionDataForSaleFailureState
    extends DispensingMedicationsState {}

class GetPrescriptionDataForSaleSuccessState
    extends DispensingMedicationsState {}
