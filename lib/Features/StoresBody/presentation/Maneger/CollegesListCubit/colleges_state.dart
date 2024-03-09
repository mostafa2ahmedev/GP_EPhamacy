part of 'colleges_cubit.dart';

@immutable
sealed class CollegesState {}

final class CollegesInitial extends CollegesState {}

final class getCollegesListLoadingState extends CollegesState {}

final class getCollegesListSuccessState extends CollegesState {}

final class getCollegesListFailureState extends CollegesState {}
