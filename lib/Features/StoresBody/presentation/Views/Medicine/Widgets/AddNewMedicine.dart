import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/MedicineModel.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/medicineCategoryModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Dispensing%20medications/widgets/AddNewCategoryMethod.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Dispensing%20medications/widgets/CustomAreaData.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/Utils/Widgets/CustomLoadingIndicator.dart';

import '../../../../../../Utils/Widgets/CustomFailureWidget.dart';
import '../../../../../Auth/Presentation/widgets/Custom_Button.dart';
import '../../Dispensing medications/widgets/CustomCircleAdd.dart';

class AddNewMedicine extends StatefulWidget {
  const AddNewMedicine({super.key});

  @override
  State<AddNewMedicine> createState() => _AddNewMedicineState();
}

class _AddNewMedicineState extends State<AddNewMedicine> {
  late GlobalKey<FormState> formKey;
  AutovalidateMode? autovalidateMode;
  late TextEditingController arbNameController;
  late TextEditingController engNameController;
  late TextEditingController strNameController;
  late TextEditingController activeIngNameController;
  late TextEditingController manufController;
  late TextEditingController codeController;
  late TextEditingController alertDaysController;
  late TextEditingController alertAmountController;

  @override
  void initState() {
    super.initState();
    arbNameController = TextEditingController();
    engNameController = TextEditingController();
    strNameController = TextEditingController();
    activeIngNameController = TextEditingController();
    manufController = TextEditingController();
    codeController = TextEditingController();
    alertDaysController = TextEditingController();
    alertAmountController = TextEditingController();
    formKey = GlobalKey();
    autovalidateMode = AutovalidateMode.disabled;
    var cubit = BlocProvider.of<MedicineCubit>(context);
    cubit.getCatagoryData();
    cubit.getUnitData();
  }

  late int catId;
  String? typeValue;
  String? unit;
  bool isDisabledLarge = false;
  bool isDisabledSmall = false;
  bool isChecked = false;
  String? smallUnit;

  @override
  void dispose() {
    arbNameController.dispose();
    engNameController.dispose();
    strNameController.dispose();
    activeIngNameController.dispose();
    manufController.dispose();
    codeController.dispose();
    alertDaysController.dispose();
    alertAmountController.dispose();
    typeValue = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(right: 10, left: 10, top: 50, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("اضافه دواء جديد",
                  style: AppStyles.styleBold32(context)
                      .copyWith(color: Colors.black)),
              const SizedBox(
                height: 12,
              ),
              BlocConsumer<MedicineCubit, MedicineState>(
                listener: (context, state) {
                  if (state is AddNewMedicineSuccessState) {
                    MethodHelper.showToast(
                        message: "تم اشافه الدواء بنجاح", type: true);
                    clearData();
                  } else if (state is AddNewMedicineFailureState) {
                    MethodHelper.showToast(
                        message: "حدثت مشكله اثناء الاضافه", type: false);
                  }
                },
                builder: (context, state) {
                  var catList =
                      BlocProvider.of<MedicineCubit>(context).categories;
                  var unitLargeList =
                      BlocProvider.of<MedicineCubit>(context).LargeUnits;
                  var unitSmallList =
                      BlocProvider.of<MedicineCubit>(context).smallUnits;

                  return state is GetCategoriesLoadingState
                      ? const CustomLoadingIndicator()
                      : state is AddNewMedicineFailureState
                          ? const CustomFailureWidget()
                          : Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: CustomDropDownButton(
                                        isExpanded: true,
                                        onChanged: (newValue) {
                                          setState(() {
                                            typeValue = newValue;
                                          });
                                          catId =
                                              BlocProvider.of<MedicineCubit>(
                                                      context)
                                                  .getCategoryId(
                                                      catName: typeValue!);
                                        },
                                        value: typeValue,
                                        items:
                                            catList.map((e) => e.name).toList(),
                                        hint: 'اختر نوع العنصر',
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                          onTap: () {
                                            addNewCategory(context,
                                                text1: "اضافه دواء جديد",
                                                text2: "اسم النوع",
                                                index: 3);
                                          },
                                          child: const CustomCircleAdd()),
                                    )
                                  ],
                                ),
                                if (typeValue == null &&
                                    autovalidateMode == AutovalidateMode.always)
                                  Text(
                                    'هذا الحقل مطلوب',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Checkbox(
                                            value: isChecked,
                                            onChanged: (data) {
                                              setState(() {
                                                unit = null;
                                                isChecked = data!;
                                              });
                                            })),
                                    Expanded(
                                      flex: 4,
                                      child: CustomDropDownButton(
                                        disabledHint: isDisabledLarge
                                            ? const Text("Disabled")
                                            : null,
                                        isExpanded: true,
                                        onChanged: (newValue) {
                                          setState(() {
                                            unit = newValue;
                                            isDisabledSmall = true;
                                            isDisabledLarge = false;
                                          });
                                        },
                                        value: unit,
                                        items: isChecked
                                            ? unitLargeList
                                                .map((e) => e.name)
                                                .toList()
                                            : unitSmallList
                                                .map((e) => e.name)
                                                .toList(),
                                        hint: 'اختر الوحده',
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                          onTap: () {
                                            isChecked
                                                ? addNewCategory(context,
                                                    text1: "اضافه وحده كبيره",
                                                    text2: "اسم الوحده",
                                                    index: 1)
                                                : addNewCategory(context,
                                                    text1: "اضافه وحده صغيره",
                                                    text2: "اسم الوحده",
                                                    index: 2);
                                          },
                                          child: const CustomCircleAdd()),
                                    )
                                  ],
                                ),
                                if (unit == null &&
                                    autovalidateMode == AutovalidateMode.always)
                                  Text(
                                    'هذا الحقل مطلوب',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                const SizedBox(
                                  height: 12,
                                ),
                                CustomAreaDataForMedicine(
                                  arbNameController: arbNameController,
                                  activeIngNameController:
                                      activeIngNameController,
                                  alertAmountController: alertAmountController,
                                  alertDaysController: alertDaysController,
                                  codeController: codeController,
                                  engNameController: engNameController,
                                  manufController: manufController,
                                  strNameController: strNameController,
                                  formKey: formKey,
                                  autovalidateMode: autovalidateMode,
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomButton(
                                        ontap: () {
                                          if (formKey.currentState!
                                                  .validate() &&
                                              validateDropdowns()) {
                                            MedicineModel medicineModel =
                                                MedicineModel(
                                              barcode: int.parse(
                                                  codeController.text),
                                              englishname:
                                                  engNameController.text,
                                              arabicname:
                                                  arbNameController.text,
                                              strength: strNameController.text,
                                              activeingredient:
                                                  activeIngNameController.text,
                                              manufacturer:
                                                  manufController.text,
                                              alertamount: int.parse(
                                                  alertAmountController.text),
                                              unit: unit!,
                                              alertexpired: int.parse(
                                                  alertDaysController.text),
                                              mediniceCategory:
                                                  MediniceCategory(
                                                      id: catId,
                                                      name: typeValue!),
                                            );
                                            BlocProvider.of<MedicineCubit>(
                                                    context)
                                                .addNewMedicine(
                                                    medicineModel:
                                                        medicineModel);
                                          } else {
                                            setState(() {
                                              autovalidateMode =
                                                  AutovalidateMode.always;
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
                                          clearData();
                                        },
                                        buttonColor: Colors.red,
                                        child: Text(
                                          'اعاده ضبط للداتا',
                                          style: AppStyles.styleBold16(context)
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void clearData() {
    arbNameController.text = '';
    engNameController.text = '';
    strNameController.text = '';
    activeIngNameController.text = '';
    manufController.text = '';
    codeController.text = '';
    alertDaysController.text = '';
    alertAmountController.text = '';
    typeValue = null;
    smallUnit = null;
    unit = null;
    autovalidateMode = AutovalidateMode.disabled;
    setState(() {});
  }

  bool validateDropdowns() {
    bool isValid = true;

    if (typeValue == null) {
      isValid = false;
    }

    if (unit == null) {
      isValid = false;
    }

    return isValid;
  }
}
