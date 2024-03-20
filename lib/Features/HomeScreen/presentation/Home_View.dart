import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Home_Mobile_View.dart';
import 'package:gppharmacy/Features/Patients/Maneger/Patient_Cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/CollegesListCubit/colleges_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/Dispensing%20medicationsCubit/dispensing_medications_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/OrdersCubit/Orders_Cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/WareHouse/cubit/warehouse_cubit.dart';
import 'package:gppharmacy/Utils/AdaptiveLayout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PateintCubit(),
        ),
        BlocProvider(
          create: (context) => DispensingMedicationsCubit(),
        ),
        BlocProvider(
          create: (context) => OrdersCubit(),
        )
      ],
      child: AdaptiveLayout(
          mobileDashboard: (context) => const MobileHomeView(),
          tabletDashboard: (context) => const SizedBox(),
          desktopDashboard: (context) => const SizedBox()),
    );
  }
}
