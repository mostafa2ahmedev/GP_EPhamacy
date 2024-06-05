import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/StoresBody/data/Orders/OrderMedicine_Model.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/OrdersCubit/OrdersCubitStates.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/OrdersCubit/Orders_Cubit.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';

class BodyOfMedicineAdditionInOrder extends StatefulWidget {
  const BodyOfMedicineAdditionInOrder({super.key});

  @override
  State<BodyOfMedicineAdditionInOrder> createState() =>
      _BodyOfMedicineAdditionInOrderState();
}

class _BodyOfMedicineAdditionInOrderState
    extends State<BodyOfMedicineAdditionInOrder> {
  late TextEditingController amountController;
  late TextEditingController dateController;
  late TextEditingController priceController;
  late TextEditingController manufactureController;
  String? medicineValue;
  late GlobalKey<FormState> key;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    dateController = TextEditingController();
    priceController = TextEditingController();
    manufactureController = TextEditingController();
    key = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<OrdersCubit, OrdersCubitStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is GetMedicineDataLoadingState
              ? const Center(child: CircularProgressIndicator())
              : Form(
                  autovalidateMode: autovalidateMode,
                  key: key,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomDropDownButton(
                        items: BlocProvider.of<MedicineCubit>(context)
                            .medicinesList
                            .map((e) => e.englishname)
                            .toList(),
                        isExpanded: true,
                        onChanged: (newValue) {
                          setState(() {
                            medicineValue = newValue;
                          });
                        },
                        value: medicineValue,
                        hint: 'اختر الدواء',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      AuthTextField(
                        controller: amountController,
                        label: "الكميه",
                        suffixIcon: const Icon(Icons.add_rounded),
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
                        controller: dateController,
                        label: "تاريخ الصلاحيه",
                        suffixIcon: const Icon(Icons.add_rounded),
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
                        controller: manufactureController,
                        label: "الشركه المصنعه",
                        suffixIcon: const Icon(Icons.add_rounded),
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
                        controller: priceController,
                        label: "السعر",
                        suffixIcon: const Icon(Icons.add_rounded),
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
                            child: CustomButton(
                              ontap: () {
                                if (key.currentState!.validate() &&
                                    medicineValue != null) {
                                  var medicineModel =
                                      BlocProvider.of<MedicineCubit>(context)
                                          .getMedicineByName(
                                              name: medicineValue!);
                                  BlocProvider.of<OrdersCubit>(context)
                                      .assignMedicineToImportList(
                                          orderModel: OrderMedicinesModel(
                                    expirydate: dateController.text,
                                    amount: int.parse(amountController.text),
                                    price: int.parse(priceController.text),
                                    medicine: medicineModel!,
                                  ));
                                  Navigator.pop(context);
                                } else {
                                  setState(() {
                                    autovalidateMode = AutovalidateMode.always;
                                  });
                                }
                              },
                              buttonColor: Theme.of(context)
                                  .drawerTheme
                                  .backgroundColor!,
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
                                if (key.currentState!.validate() &&
                                    medicineValue != null) {}
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
                  ),
                );
        },
      ),
    );
  }
}
