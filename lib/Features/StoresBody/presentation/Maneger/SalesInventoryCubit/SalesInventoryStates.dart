part of 'SalesInventoryCubit.dart';

@immutable
sealed class SalesInventoryStates {}

final class StoresCubitInitial extends SalesInventoryStates {}

final class getSalesInventoryLoadingState extends SalesInventoryStates {}

final class getDetailsSalesInventoryLoadingState extends SalesInventoryStates {}

final class getSalesInventorySuccessState extends SalesInventoryStates {}

final class getSalesInventoryFailureState extends SalesInventoryStates {}
