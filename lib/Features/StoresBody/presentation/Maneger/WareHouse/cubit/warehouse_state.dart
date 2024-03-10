part of 'warehouse_cubit.dart';

@immutable
sealed class WarehouseState {}

final class WarehouseInitial extends WarehouseState {}

final class GetWarehouseDataSuccessState extends WarehouseState {}

final class GetWarehouseDataFailureState extends WarehouseState {}

final class GetWarehouseDataLoadingState extends WarehouseState {}

final class SearchWarehouseDataSuccessState extends WarehouseState {}
