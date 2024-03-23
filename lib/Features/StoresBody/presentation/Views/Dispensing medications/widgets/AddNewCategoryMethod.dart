import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';

import 'package:gppharmacy/Utils/AppStyles.dart';

import '../../../../../Auth/Presentation/widgets/Auth_Text_Field.dart';
import '../../../../../Auth/Presentation/widgets/Custom_Button.dart';

Future<dynamic> addNewCategory(BuildContext context) {
  var controller = TextEditingController();
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('اضافه دواء جديد'),
        content: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AuthTextField(
                  controller: controller,
                  label: 'اسم النوع',
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
                          BlocProvider.of<MedicineCubit>(context)
                              .addNewCategory(category: controller.text);

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
