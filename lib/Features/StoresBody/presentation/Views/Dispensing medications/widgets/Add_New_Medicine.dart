import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';

import '../../../../data/SalesInventory/MedicineModel.dart';
import '../../../../data/SalesInventory/medicineCategoryModel.dart';

class AddNewMedicine extends StatefulWidget {
  const AddNewMedicine({super.key});

  @override
  State<AddNewMedicine> createState() => _AddNewMedicineState();
}

String? value;
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

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          showDragHandle: true,
          context: context,
          builder: (context) {
            return Container(
              height: MediaQuery.sizeOf(context).height * .9,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
                          },
                          value: value,
                          items: const ['اقراص', 'امبولات', 'شراب', 'قطرات'],
                          hint: 'اختر نوع العنصر',
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Container();
                              },
                            );
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
                  const AuthTextField(
                    label: 'اسم الدواء (عربي)',
                    suffixIcon: Icon(Icons.language),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const AuthTextField(
                    label: 'اسم الدواء (انجليزي)',
                    suffixIcon: Icon(Icons.abc),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const AuthTextField(
                    label: 'الماده الفعاله',
                    suffixIcon: Icon(Icons.abc),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const AuthTextField(
                    keyboardType: TextInputType.number,
                    label: 'التركيز',
                    suffixIcon: Icon(Icons.abc),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const AuthTextField(
                    label: 'الشركه المصنعه',
                    suffixIcon: Icon(Icons.abc),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const AuthTextField(
                    keyboardType: TextInputType.number,
                    label: 'كود العنصر',
                    suffixIcon: Icon(Icons.handshake),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const AuthTextField(
                    keyboardType: TextInputType.number,
                    label: 'التنبيه قبل (كميه)',
                    suffixIcon: Icon(Icons.alarm),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const AuthTextField(
                    keyboardType: TextInputType.number,
                    label: 'التنبيه قبل (يوم)',
                    suffixIcon: Icon(Icons.alarm),
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
                              activeingredient: activeIngNameController.text,
                              manufacturer: manufController.text,
                              alertamount: 10,
                              alertexpired: alertDaysController.text,
                              mediniceCategory: MediniceCategory(
                                  id: 5, name: alertDaysController.text),
                            );
                            BlocProvider.of<MedicineCubit>(context)
                                .addNewMedicine(medicineModel: medicineModel);
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
                          ontap: () {},
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
      child: const Icon(Icons.add),
    );
  }
}
