part of 'medicine_cubit.dart';

class MedicineState {}

class MedicineInitial extends MedicineState {}

//
class GetMedicineDataLoadingState extends MedicineState {}

class GetMedicineDataSuccessState extends MedicineState {}

class GetMedicineDataFailureState extends MedicineState {}

class SearchinMedicineDataSuccessState extends MedicineState {}

//
class UpdateMedicineDataSuccessState extends MedicineState {}

class UpdateMedicineDataLoadingState extends MedicineState {}

//
class AddNewMedicineLoadingState extends MedicineState {}

class AddNewMedicineSuccessState extends MedicineState {}

class AddNewMedicineFailureState extends MedicineState {}

//get categories
class GetCategoriesLoadingState extends MedicineState {}

class GetCategoriesSuccessState extends MedicineState {}

class AssignMedicineToPrescriptionList extends MedicineState {}

class NoDataFound extends MedicineState {}
