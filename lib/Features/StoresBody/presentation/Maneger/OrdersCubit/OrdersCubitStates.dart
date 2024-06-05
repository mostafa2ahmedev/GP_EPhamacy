class OrdersCubitStates {}

class OrdersCubitLoadingStates extends OrdersCubitStates {}

class OrdersCubitSuccessStates extends OrdersCubitStates {}

class OrdersCubitFaulierStates extends OrdersCubitStates {
  final String errorMsg;

  OrdersCubitFaulierStates({required this.errorMsg});
}

class GetSupplierDataSuccess extends OrdersCubitStates {}

class GetSupplierDataLoading extends OrdersCubitStates {}

class GetSupplierDataFailure extends OrdersCubitStates {}

class PostOrderDataLoadingState extends OrdersCubitStates {}

class PostOrderDataSuccessState extends OrdersCubitStates {}

class PostOrderDataFailureState extends OrdersCubitStates {}

class AssignOrderModelToImportListSuccessState extends OrdersCubitStates {}

class PostMedicineDataLoadingState extends OrdersCubitStates {}

class PostMedicineDataSuccessState extends OrdersCubitStates {}

class PostMedicineDataFailureState extends OrdersCubitStates {}
