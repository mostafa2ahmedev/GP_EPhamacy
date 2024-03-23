import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Dispensing%20medications/widgets/AddNewCategoryMethod.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Dispensing%20medications/widgets/CustomAreaData.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';

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
  }

  String? value;
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
    value = null;
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
            return StatefulBuilder(
              builder: (context, setStateB) {
                return Container(
                  height: MediaQuery.sizeOf(context).height * .9,
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: CustomDropDownButton(
                              isExpanded: true,
                              onChanged: (newValue) {
                                value = newValue;
                                setStateB(() {
                                  value = newValue;
                                });
                              },
                              value: value,
                              items: const [
                                'اقراص',
                                'امبولات',
                                'شراب',
                                'قطرات'
                              ],
                              hint: 'اختر نوع العنصر',
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                addNewCategory(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade300,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomAreaData(
                        arbNameController: arbNameController,
                        activeIngNameController: activeIngNameController,
                        alertAmountController: alertAmountController,
                        alertDaysController: alertDaysController,
                        codeController: codeController,
                        engNameController: engNameController,
                        manufController: manufController,
                        strNameController: strNameController,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              ontap: () {
                                MedicineModel medicineModel = MedicineModel(
                                  barcode: 56,
                                  englishname: engNameController.text,
                                  arabicname: arbNameController.text,
                                  strength: strNameController.text,
                                  activeingredient:
                                      activeIngNameController.text,
                                  manufacturer: manufController.text,
                                  alertamount: 10,
                                  alertexpired: alertDaysController.text,
                                  mediniceCategory: MediniceCategory(
                                      id: 5, name: alertDaysController.text),
                                );
                                BlocProvider.of<MedicineCubit>(context)
                                    .addNewMedicine(
                                        medicineModel: medicineModel);
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
                                value = null;
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
