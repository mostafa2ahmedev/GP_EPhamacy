import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/OrdersCubit/OrdersCubitStates.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/OrdersCubit/Orders_Cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Dispensing%20medications/widgets/AddNewCategoryMethod.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Orders/widgets/BodyOfAddMedicineInOrder.dart';
import 'package:gppharmacy/Utils/Widgets/CustomLoadingIndicator.dart';

import '../../../../../../Utils/AppStyles.dart';
import '../../../../../../Utils/Widgets/CustomDropDownButton.dart';
import '../../../../../../Utils/Widgets/CustomFailureWidget.dart';
import '../../../../../Auth/Presentation/widgets/Auth_Text_Field.dart';
import '../../../../../Auth/Presentation/widgets/Custom_Button.dart';
import '../../Dispensing medications/widgets/CustomCircleAdd.dart';

class AddNewImports extends StatefulWidget {
  const AddNewImports({super.key});

  @override
  State<AddNewImports> createState() => _AddNewImportsState();
}

class _AddNewImportsState extends State<AddNewImports> {
  late TextEditingController supplierController,
      dateController,
      execuseController;
  late GlobalKey<FormState> key;
  String? supplierValue;

  @override
  void initState() {
    super.initState();

    supplierController = TextEditingController();
    dateController = TextEditingController();
    execuseController = TextEditingController();
    key = GlobalKey();
    BlocProvider.of<OrdersCubit>(context).getSupplierData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "اضافه طلبيه جديده",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              BlocConsumer<OrdersCubit, OrdersCubitStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  var supplierList =
                      BlocProvider.of<OrdersCubit>(context).suppliers;
                  return state is GetSupplierDataLoading
                      ? const CustomLoadingIndicator()
                      : state is GetSupplierDataFailure
                          ? const CustomFailureWidget()
                          : Form(
                              key: key,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: CustomDropDownButton(
                                          items: supplierList
                                              .map((e) => e.name)
                                              .toList(),
                                          isExpanded: true,
                                          onChanged: (newValue) {
                                            setState(() {
                                              supplierValue = newValue;
                                            });
                                          },
                                          value: supplierValue,
                                          hint: 'اختر اسم المورد',
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                            onTap: () {
                                              addNewCategory(context,
                                                  text1: "اضافه مورد جديد",
                                                  text2: "اسم المورد",
                                                  index: 4);
                                            },
                                            child: const CustomCircleAdd()),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  AuthTextField(
                                    label: 'طلب الامداد',
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
                                    label: 'اذن التسليم',
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
                                    label: 'تاريخ التوريد',
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
                                          ontap: () {
                                            //  addMedicineInPrescription(context,child: );
                                          },
                                          buttonColor: Theme.of(context)
                                              .drawerTheme
                                              .backgroundColor!,
                                          child: Text(
                                            'اضافه دواء',
                                            style:
                                                AppStyles.styleBold16(context)
                                                    .copyWith(
                                                        color: Colors.white),
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
                                                supplierValue != null) {}
                                          },
                                          buttonColor: Colors.green,
                                          child: Text(
                                            'اضافه طلبيه',
                                            style:
                                                AppStyles.styleBold16(context)
                                                    .copyWith(
                                                        color: Colors.white),
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
                                            supplierController.text = '';
                                            dateController.text = '';
                                            execuseController.text = '';
                                            setState(() {});
                                          },
                                          buttonColor: Colors.red,
                                          child: const Icon(Icons.remove),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BodyOfAddMedicineInPresription extends StatelessWidget {
  const BodyOfAddMedicineInPresription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
