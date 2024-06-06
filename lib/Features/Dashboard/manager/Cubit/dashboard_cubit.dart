import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Dashboard/manager/Cubit/dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitialState());
}
