import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Dispensing%20medications/widgets/AddNewCategoryMethod.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Dispensing%20medications/widgets/CustomAreaData.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Dispensing%20medications/widgets/CustomCircleAdd.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/Utils/Widgets/CustomFailureWidget.dart';
import 'package:gppharmacy/Utils/Widgets/CustomLoadingIndicator.dart';

import '../../../../data/SalesInventory/MedicineModel.dart';
import '../../../../data/SalesInventory/medicineCategoryModel.dart';

class AddNewMedicine extends StatefulWidget {
  const AddNewMedicine({super.key});

  @override
  State<AddNewMedicine> createState() => _AddNewMedicineState();
}

late TextEditingController arbNameController;
late TextEditingController engNameController;
late TextEditingController strNameController;
late TextEditingController activeIngNameController;
late TextEditingController manufController;
late TextEditingController codeController;
late TextEditingController alertDaysController;
late TextEditingController alertAmountController;

class _AddNewMedicineState extends State<AddNewMedicine> {
  late GlobalKey<FormState> formKey;
  AutovalidateMode? autovalidateMode;

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
    var cubit = BlocProvider.of<MedicineCubit>(context);

    cubit.getUnitData();
  }

  String? typeValue;
  String? largeUnit;

  String? smallUnit;
  bool isAllowed = false;
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
    return FloatingActionButton(
      backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      onPressed: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          showDragHandle: true,
          context: context,
          builder: (c) {
            BlocProvider.of<MedicineCubit>(context).getCatagoryData();
            return StatefulBuilder(
              builder: (context, setStateB) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * .9,
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: BlocBuilder<MedicineCubit, MedicineState>(
                        builder: (context, state) {
                      var typeList =
                          BlocProvider.of<MedicineCubit>(context).categories;
                      var unitLargeList =
                          BlocProvider.of<MedicineCubit>(context).LargeUnits;
                      var unitSmallList =
                          BlocProvider.of<MedicineCubit>(context).smallUnits;

                      if (state is GetCategoriesLoadingState) {
                        return const CustomLoadingIndicator();
                      } else if (state is GetCategoriesSuccessState) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: CustomDropDownButton(
                                      isExpanded: true,
                                      onChanged: (newValue) {
                                        typeValue = newValue;
                                        setStateB(() {
                                          typeValue = newValue;
                                        });
                                      },
                                      value: typeValue,
                                      items:
                                          typeList.map((e) => e.name).toList(),
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
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: CustomDropDownButton(
                                      isExpanded: true,
                                      onChanged: (newValue) {
                                        largeUnit = newValue;
                                        setStateB(() {
                                          largeUnit = newValue;
                                        });
                                      },
                                      value: largeUnit,
                                      items: unitLargeList
                                          .map((e) => e.name)
                                          .toList(),
                                      hint: 'اختر نوع العنصر',
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                        onTap: () {
                                          addNewCategory(context,
                                              text1: "اضافه وحده كبيره",
                                              text2: "اسم الوحده",
                                              index: 1);
                                        },
                                        child: const CustomCircleAdd()),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: CustomDropDownButton(
                                      isExpanded: true,
                                      onChanged: (newValue) {
                                        smallUnit = newValue;
                                        setStateB(() {
                                          smallUnit = newValue;
                                        });
                                      },
                                      value: smallUnit,
                                      items: unitSmallList
                                          .map((e) => e.name)
                                          .toList(),
                                      hint: 'اختر نوع العنصر',
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        addNewCategory(context,
                                            text1: "اضافه وحده صغيره",
                                            text2: "اسم الوحده",
                                            index: 2);
                                      },
                                      child: const CustomCircleAdd(),
                                    ),
                                  )
                                ],
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
                                        if (formKey.currentState!.validate()) {
                                          MedicineModel medicineModel =
                                              MedicineModel(
                                            barcode: 56,
                                            englishname: engNameController.text,
                                            arabicname: arbNameController.text,
                                            strength: strNameController.text,
                                            activeingredient:
                                                activeIngNameController.text,
                                            manufacturer: manufController.text,
                                            alertamount: 10,
                                            unit: "jjj",
                                            alertexpired: 10,
                                            mediniceCategory: MediniceCategory(
                                                id: 5, name: typeValue!),
                                          );
                                          BlocProvider.of<MedicineCubit>(
                                                  context)
                                              .addNewMedicine(
                                                  medicineModel: medicineModel);
                                        } else {
                                          setStateB(() {
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
                                        arbNameController.text = '';
                                        engNameController.text = '';
                                        strNameController.text = '';
                                        activeIngNameController.text = '';
                                        manufController.text = '';
                                        codeController.text = '';
                                        alertDaysController.text = '';
                                        alertAmountController.text = '';
                                        typeValue = null;
                                        setStateB(() {});
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
                          ),
                        );
                      } else {
                        return const CustomFailureWidget();
                      }
                    }),
                  ),
                );
              },
            );
          },
        );
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
