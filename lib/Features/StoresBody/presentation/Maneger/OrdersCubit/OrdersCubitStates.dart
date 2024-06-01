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
