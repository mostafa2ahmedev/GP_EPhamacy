abstract class SalesInventoryStates {}

class StoresCubitInitial extends SalesInventoryStates {}

class GetSalesInventoryLoadingState extends SalesInventoryStates {}

class GetDetailsSalesInventoryLoadingState extends SalesInventoryStates {}

class GetSalesInventorySuccessState extends SalesInventoryStates {}

class GetSalesInventoryFailureState extends SalesInventoryStates {}
