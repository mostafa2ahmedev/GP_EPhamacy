import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/OrdersCubit/Orders_Cubit.dart';

import 'package:gppharmacy/Utils/AppStyles.dart';

import '../../../../../Auth/Presentation/widgets/Auth_Text_Field.dart';
import '../../../../../Auth/Presentation/widgets/Custom_Button.dart';
import '../../../../../Patients/Maneger/Patient_Cubit.dart';

Future<dynamic> addNewCategory(BuildContext context,
    {required String text1, required String text2, required int index}) {
  var controller = TextEditingController();
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(text1),
        content: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AuthTextField(
                  controller: controller,
                  label: text2,
                  suffixIcon: const Icon(Icons.add_rounded),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        ontap: () {
                          if (index == 1) {
                            BlocProvider.of<MedicineCubit>(context).addUnit(
                                unitValue: controller.text, isLarge: true);
                          } else if (index == 2) {
                            BlocProvider.of<MedicineCubit>(context).addUnit(
                                unitValue: controller.text, isLarge: false);
                          } else if (index == 3) {
                            BlocProvider.of<MedicineCubit>(context)
                                .addNewCategory(category: controller.text);
                          } else if (index == 4) {
                            BlocProvider.of<OrdersCubit>(context)
                                .addNewSupplier(name: controller.text);
                          } else if (index == 5) {
                            BlocProvider.of<PateintCubit>(context)
                                .postNewChronicDiesease(name: controller.text);
                          }

                          Navigator.pop(context);
                        },
                        buttonColor:
                            Theme.of(context).drawerTheme.backgroundColor!,
                        child: Text(
                          'اتمام العمليه',
                          style: AppStyles.styleBold16(context)
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: CustomButton(
                        ontap: () {
                          Navigator.pop(context);
                        },
                        buttonColor: Colors.red,
                        child: Text(
                          'تراجع',
                          style: AppStyles.styleBold16(context)
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )),
      );
    },
  );
}

Future<dynamic> addMedicineInOrder(BuildContext context,
    {required Widget child}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("اختر اسم الدواء المراد اضافته"),
        content: SizedBox(width: double.infinity, child: child),
      );
    },
  );
}

Future<dynamic> addMedicineInPrescription(BuildContext context,
    {required Widget child}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("اختر اسم الدواء المراد اضافته"),
        content: SizedBox(width: double.infinity, child: child),
      );
    },
  );
}
