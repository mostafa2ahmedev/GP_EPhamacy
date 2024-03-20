import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Home_Mobile_View.dart';
import 'package:gppharmacy/Features/Patients/Maneger/Patient_Cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/OrdersCubit/Orders_Cubit.dart';
import 'package:gppharmacy/Utils/AdaptiveLayout.dart';
import 'package:gppharmacy/Utils/Widgets/BlocsIntegrator.dart';

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
          create: (context) => OrdersCubit(),
        ),
        BlocProvider(
          create: (context) => MedicineCubit(),
        ),
      ],
      child: AdaptiveLayout(
          mobileDashboard: (context) => const MobileHomeView(),
          tabletDashboard: (context) => const SizedBox(),
          desktopDashboard: (context) => const SizedBox()),
    );
  }
}
