import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/SalesInventoryCubit/SalesInventoryCubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/Mobile_Hsr_Elmabe3at.dart';

class SalesBlocIntegrator extends StatelessWidget {
  const SalesBlocIntegrator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SalesInventoryCubit();
      },
      child: const MobileHsrElmabe3at(),
    );
  }
}
