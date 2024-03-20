import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/CollegesListCubit/colleges_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/SalesInventoryCubit/SalesInventoryCubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/WareHouse/cubit/warehouse_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/CollegesList/MobileHsrElkolyat.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Medicine/Mobile_Medicines.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/Mobile_Hsr_Elmabe3at.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/warehouse/warehouse.dart';

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

class MedicineBlocIntegrator extends StatelessWidget {
  const MedicineBlocIntegrator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MedicineCubit();
      },
      child: const MobileMedicines(),
    );
  }
}

class WareHouseBlocIntegrator extends StatelessWidget {
  const WareHouseBlocIntegrator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return WarehouseCubit();
      },
      child: const Warehouse(),
    );
  }
}

class CollegesBlocIntegrator extends StatelessWidget {
  const CollegesBlocIntegrator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CollegesCubit();
      },
      child: const MobileHsrElkolyat(),
    );
  }
}
