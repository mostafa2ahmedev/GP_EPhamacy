import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit_State.dart';

import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Custom_Drawer.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/widgets/Home_App_Bar.dart';
import 'package:gppharmacy/Features/Patients/Maneger/Patient_Cubit.dart';
import 'package:gppharmacy/Features/Patients/Presentation/Views/Add_New_Patient.dart';
import 'package:gppharmacy/Features/Patients/Presentation/Views/Patient_View.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/OrdersCubit/Orders_Cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Dispensing%20medications/widgets/AddNewPrescription.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Medicine/Mobile_Medicines.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Medicine/Widgets/AddNewMedicine.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Orders/MobileImports.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Orders/widgets/FloatingNavigate.dart';

import 'package:gppharmacy/Utils/Widgets/BlocsIntegrator.dart';
import 'package:gppharmacy/generated/l10n.dart';

import '../../../../Utils/Methods_Helper.dart';
import '../../../StoresBody/presentation/Views/Orders/widgets/AddNewImports.dart';

class MobileHomeView extends StatefulWidget {
  const MobileHomeView({super.key});

  @override
  State<MobileHomeView> createState() => _MobileHomeViewState();
}

class _MobileHomeViewState extends State<MobileHomeView> {
  final GlobalKey<ScaffoldState> scafoldKey = GlobalKey();

  static const List<List<Widget>> bodyWidgets = [
    [
      SalesBlocIntegrator(),
      MobileMedicines(),
      WareHouseBlocIntegrator(),
      MobileImports(),
      CollegesBlocIntegrator(),
      DispensingMedicationsBlocIntegrator()
    ],
    [
      PatientView(),
      AddNewPatient(),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubit, DrawerStates>(
      listener: (context, state) {
        if (state is DrawerSelectedIndexChanged) {
          scafoldKey.currentState!.closeDrawer();
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<DrawerCubit>(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          key: scafoldKey,
          drawer: const CustomMobileDrawer(),
          appBar: HomeAppBar(scafoldKey: scafoldKey),
          body: cubit.outerSelectedIndex == 0
              ? bodyWidgets[cubit.outerSelectedIndex]
                  [cubit.innerFirstSelectedIndex]
              : bodyWidgets[cubit.outerSelectedIndex]
                  [cubit.innerSecondSelectedIndex],
          floatingActionButton: cubit.data1 == S.of(context).Medicines
              ? FloatingNavigate(
                  ontap: () =>
                      MethodHelper.navigateTo(context, const AddNewMedicine()),
                )
              : cubit.data1 == S.of(context).Imports
                  ? FloatingNavigate(
                      ontap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNewImports(),
                        ),
                      ).then((result) {
                        if (result == true) {
                          BlocProvider.of<OrdersCubit>(context)
                              .fetchAllOrders();
                        }
                      }),
                    )
                  : cubit.data1 == S.of(context).SrfEladwya
                      ? FloatingNavigate(
                          ontap: () => MethodHelper.navigateTo(
                              context, const AddNewPrescription()),
                        )
                      : cubit.data2 == S.of(context).AllPatient
                          ? FloatingNavigate(
                              ontap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddNewPatient(),
                                ),
                              ).then((result) {
                                if (result == true) {
                                  BlocProvider.of<PateintCubit>(context)
                                      .fetchAllPateint();
                                }
                              }),
                            )
                          : null,
        );
      },
    );
  }
}
