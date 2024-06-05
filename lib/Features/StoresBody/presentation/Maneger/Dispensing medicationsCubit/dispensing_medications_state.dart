abstract class DispensingMedicationsState {}

class DispensingMedicationsInitial extends DispensingMedicationsState {}

class GetPrescriptionDataLoadingState extends DispensingMedicationsState {}

class GetPrescriptionDataFailureState extends DispensingMedicationsState {}

class GetPrescriptionDataSuccessState extends DispensingMedicationsState {}

class ChangeTotalAmount extends DispensingMedicationsState {}

class GetPrescriptionDataForSaleLoadingState
    extends DispensingMedicationsState {}

class GetPrescriptionDataForSaleFailureState
    extends DispensingMedicationsState {}

class GetPrescriptionDataForSaleSuccessState
    extends DispensingMedicationsState {}

class PostPatientDataLoadingState extends DispensingMedicationsState {}

class PostPatientDataSuccessState extends DispensingMedicationsState {}

class PostPatientDataFailureState extends DispensingMedicationsState {}

class GetInventorySalesPrescriptionLoadingState
    extends DispensingMedicationsState {}

class GetInventorySalesPrescriptionSuccessState
    extends DispensingMedicationsState {}

class NoDataInList extends DispensingMedicationsState {}

class GetInventorySalesPrescriptionFailureState
    extends DispensingMedicationsState {}
