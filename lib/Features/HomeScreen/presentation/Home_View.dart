import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Home_Mobile_View.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/cubit/stores_cubit_cubit.dart';
import 'package:gppharmacy/Utils/AdaptiveLayout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoresCubit(),
      child: AdaptiveLayout(
          mobileDashboard: (context) => const MobileHomeView(),
          tabletDashboard: (context) => const SizedBox(),
          desktopDashboard: (context) => const SizedBox()),
    );
  }
}
