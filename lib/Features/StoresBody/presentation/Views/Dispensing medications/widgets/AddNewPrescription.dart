import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Dispensing%20medications/widgets/CustomCircleAdd.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';

import '../../../../../Auth/Presentation/widgets/Auth_Text_Field.dart';
import '../../../../../Auth/Presentation/widgets/Custom_Button.dart';
import '../../../Maneger/OrdersCubit/Orders_Cubit.dart';

class AddNewPrescription extends StatefulWidget {
  const AddNewPrescription({super.key});

  @override
  State<AddNewPrescription> createState() => _AddNewPrescriptionState();
}

class _AddNewPrescriptionState extends State<AddNewPrescription> {
  late TextEditingController nameController,
      nationalIdController,
      collegeController,
      levelController,
      phoneController,
      presIdController,
      diseaseController;
  late GlobalKey<FormState> key;
  String? chronicValue;
  String hint = 'اختر نوع الروشته';

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    nationalIdController = TextEditingController();
    collegeController = TextEditingController();
    levelController = TextEditingController();
    phoneController = TextEditingController();
    presIdController = TextEditingController();
    diseaseController = TextEditingController();
    key = GlobalKey();
    BlocProvider.of<OrdersCubit>(context).getSupplierData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "اضافه روشته جديده",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Form(
                key: key,
                child: Column(
                  children: [
                    CustomDropDownButton(
                      isExpanded: true,
                      items: const ['مزمن', 'غير مزمن'],
                      hint: hint,
                      onChanged: (value) {
                        setState(() {
                          chronicValue = value!;
                        });
                      },
                      value: chronicValue,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    AuthTextField(
                      label: 'اسم الطالب',
                      suffixIcon: const Icon(Icons.abc),
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    AuthTextField(
                      label: 'الرقم القومي',
                      suffixIcon: const Icon(Icons.abc),
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    AuthTextField(
                      label: 'الكليه',
                      suffixIcon: const Icon(Icons.abc),
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    AuthTextField(
                      label: 'رقم الهاتف',
                      suffixIcon: const Icon(Icons.abc),
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    AuthTextField(
                      label: 'الفرقه الدراسيه',
                      suffixIcon: const Icon(Icons.abc),
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    AuthTextField(
                      label: 'رقم الروشته',
                      suffixIcon: const Icon(Icons.abc),
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    AuthTextField(
                      label: 'التشخيص',
                      suffixIcon: const Icon(Icons.abc),
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomButton(
                            ontap: () {},
                            buttonColor:
                                Theme.of(context).drawerTheme.backgroundColor!,
                            child: Text(
                              'اضافه دواء',
                              style: AppStyles.styleBold16(context)
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          flex: 2,
                          child: CustomButton(
                            ontap: () {
                              if (key.currentState!.validate() &&
                                  chronicValue != null) {}
                            },
                            buttonColor: Colors.green,
                            child: Text(
                              'اضافه روشته',
                              style: AppStyles.styleBold16(context)
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            ontap: () {
                              setState(() {
                                nameController.text = "";
                                nationalIdController.text = "";
                                collegeController.text = "";
                                levelController.text = "";
                                phoneController.text = "";
                                presIdController.text = "";
                                diseaseController.text = "";
                              });
                            },
                            buttonColor: Colors.red,
                            child: const Icon(Icons.remove),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
