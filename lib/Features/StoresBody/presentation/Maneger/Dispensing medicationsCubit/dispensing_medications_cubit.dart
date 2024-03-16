import 'package:bloc/bloc.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/Dispensing%20medicationsCubit/dispensing_medications_state.dart';

class DispensingMedicationsCubit extends Cubit<DispensingMedicationsState> {
  DispensingMedicationsCubit() : super(DispensingMedicationsInitial());
}
