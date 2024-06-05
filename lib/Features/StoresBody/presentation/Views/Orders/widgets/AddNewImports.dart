import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/data/Orders/OrderMedicine_Model.dart';
import 'package:gppharmacy/Features/StoresBody/data/Orders/Order_Model.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/OrdersCubit/OrdersCubitStates.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/OrdersCubit/Orders_Cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Dispensing%20medications/widgets/AddNewCategoryMethod.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Orders/widgets/BodyOfAddMedicineInOrder.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Orders/widgets/CustomMedicineView.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/widgets/CustomDetailsItem.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';
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
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? supplierErrorMessage;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrdersCubit>(context).orderMedicines = [];
    supplierController = TextEditingController();
    dateController = TextEditingController();
    execuseController = TextEditingController();
    key = GlobalKey();
    BlocProvider.of<OrdersCubit>(context).getSupplierData();
    BlocProvider.of<MedicineCubit>(context).getMedicineData(typeOfSearch: 4);
  }

  @override
  void dispose() {
    super.dispose();
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
              Text("اضافه طلبيه جديده",
                  style: AppStyles.styleBold32(context)
                      .copyWith(color: Colors.black)),
              const SizedBox(
                height: 12,
              ),
              BlocConsumer<OrdersCubit, OrdersCubitStates>(
                listener: (context, state) {
                  if (state is PostMedicineDataLoadingState) {
                    MethodHelper.showToast(
                        message: "تم اضافه الطلبيه بنجاح", type: true);
                    Navigator.pop(context);
                    BlocProvider.of<OrdersCubit>(context).getSupplierData();
                  } else if (state is PostMedicineDataFailureState) {
                    MethodHelper.showToast(
                        message: "حدث خطأ اثناء الاضافه", type: false);
                  }
                },
                builder: (context, state) {
                  var orderCubit = BlocProvider.of<OrdersCubit>(context);
                  var supplierList =
                      BlocProvider.of<OrdersCubit>(context).suppliers;
                  return state is GetSupplierDataLoading
                      ? const CustomLoadingIndicator()
                      : state is GetSupplierDataFailure
                          ? const CustomFailureWidget()
                          : Form(
                              key: key,
                              autovalidateMode: autovalidateMode,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomDropDownButton(
                                              items: supplierList
                                                  .map((e) => e.name)
                                                  .toList(),
                                              isExpanded: true,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  supplierValue = newValue;
                                                  supplierErrorMessage = null;
                                                });
                                              },
                                              value: supplierValue,
                                              hint: 'اختر اسم المورد',
                                            ),
                                            if (supplierErrorMessage != null)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text(
                                                  supplierErrorMessage!,
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                          ],
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
                                    controller: supplierController,
                                    label: 'طلب الامداد',
                                    suffixIcon: const Icon(Icons.numbers),
                                    validator: (data) {
                                      if (data == null || data.isEmpty) {
                                        return 'هذا الحقل مطلوب';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  AuthTextField(
                                    controller: execuseController,
                                    label: 'اذن التسليم',
                                    suffixIcon: const Icon(Icons.receipt),
                                    validator: (data) {
                                      if (data == null || data.isEmpty) {
                                        return 'هذا الحقل مطلوب';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  AuthTextField(
                                    controller: dateController,
                                    label: 'تاريخ التوريد',
                                    suffixIcon: const Icon(Icons.date_range),
                                    validator: (data) {
                                      if (data == null || data.isEmpty) {
                                        return 'هذا الحقل مطلوب';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  if (state
                                      is AssignOrderModelToImportListSuccessState)
                                    CustomMedicineView2(
                                      orderMedicineList:
                                          orderCubit.orderMedicines,
                                    ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: CustomButton(
                                          ontap: () {
                                            addMedicineInOrder(context,
                                                child:
                                                    const BodyOfMedicineAdditionInOrder());
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
                                                supplierValue != null &&
                                                orderCubit.orderMedicines
                                                    .isNotEmpty) {
                                              orderCubit.postMedicineImportData(
                                                  orderModel: OrderModel(
                                                      supplyrequest: int.parse(
                                                          supplierController
                                                              .text),
                                                      deliveryrequest:
                                                          int.parse(
                                                              execuseController
                                                                  .text),
                                                      dateofsupply:
                                                          dateController.text,
                                                      supplier: orderCubit
                                                          .getSupplierDataByName(
                                                              name:
                                                                  supplierValue!)!,
                                                      orderMedicines: orderCubit
                                                          .orderMedicines));
                                            } else {
                                              setState(() {
                                                autovalidateMode =
                                                    AutovalidateMode.always;
                                                if (supplierValue == null) {
                                                  supplierErrorMessage =
                                                      'هذا الحقل مطلوب';
                                                }
                                              });
                                            }
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

class CustomCustom3 extends StatelessWidget {
  const CustomCustom3({Key? key, required this.orderMedicinesModel})
      : super(key: key);

  final OrderMedicinesModel? orderMedicinesModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        CustomDetailsItem(
          note: 'الدواء',
          data: orderMedicinesModel!.medicine.englishname,
          icon: Icons.medication_outlined,
        ),
        SizedBox(
          height: 3,
        ),
        CustomDetailsItem(
          note: 'الكميه',
          data: orderMedicinesModel!.amount.toString(),
          icon: Icons.numbers_sharp,
        ),
        SizedBox(
          height: 3,
        ),
        CustomDetailsItem(
          note: 'الصلاحيه',
          data: orderMedicinesModel!.expirydate,
          icon: Icons.date_range,
        ),
        SizedBox(
          height: 3,
        ),
        CustomDetailsItem(
          note: 'اسم المورد',
          data: orderMedicinesModel!.medicine.manufacturer ?? "",
          icon: Icons.person_2,
        ),
        SizedBox(
          height: 3,
        ),
        CustomDetailsItem(
          note: 'السعر',
          data: orderMedicinesModel!.price.toString(),
          icon: Icons.price_change,
        ),
      ],
    );
  }
}
