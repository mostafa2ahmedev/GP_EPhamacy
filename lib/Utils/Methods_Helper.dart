import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Maneger/Auth_Cubit.dart';

import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';
import 'package:gppharmacy/Features/Patients/data/Patient_Model.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/DetailsForSalesInventoryModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/WareHouse/cubit/warehouse_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/widgets/CustomDetailsItem.dart';

import 'package:gppharmacy/generated/l10n.dart';

abstract class MethodHelper {
  static void navigateTo(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
      ),
    );
  }

  static void navigateToWithRep(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
      ),
    );
  }

  static List<DropdownMenuItem<String>> getDropDownItems(List list) {
    return List.generate(
      list.length,
      (index) => DropdownMenuItem(
        value: list[index],
        child: Text(
          list[index],
        ),
      ),
    );
  }

  static void checkForTheIndex(
      int outerIndex, String? data, DrawerCubit cubit, BuildContext context) {
    if (outerIndex == 0) {
      cubit.outerSelectedIndex = 0;
      switch (data) {
        case "حصر المبيعات" || "Sales inventory":
          cubit.innerFirstSelectedIndex = 0;
          cubit.data1 = S.of(context).HsrElmbe3at;
          break;
        case "الادويه" || "Medicines":
          cubit.innerFirstSelectedIndex = 1;
          cubit.data1 = S.of(context).Medicines;
          break;
        case "عهدة المخزن" || "3ohdeElm5zn":
          cubit.innerFirstSelectedIndex = 2;
          cubit.data1 = S.of(context).H3ohdeElm5zn;

          BlocProvider.of<WarehouseCubit>(context).getWarehouseData(
            token: BlocProvider.of<AuthCubit>(context).user!.token,
          );
          break;
        case "الواردات" || "Imports":
          cubit.innerFirstSelectedIndex = 3;
          cubit.data1 = S.of(context).Imports;
          break;
        case "حصر الكليات" || "Colleges inventory":
          cubit.innerFirstSelectedIndex = 4;
          cubit.data1 = S.of(context).HsrElkolyat;
          break;
        case "صرف الادويه" || "SrfEladwya":
          cubit.innerFirstSelectedIndex = 5;
          cubit.data1 = S.of(context).SrfEladwya;
          break;
      }
    } else if (outerIndex == 1) {
      cubit.outerSelectedIndex = 1;
      switch (data) {
        case "جميع المرضي" || "All Patient":
          cubit.innerFirstSelectedIndex = 0;
          cubit.data2 = S.of(context).AllPatient;
          break;
        case "اضافه مريض جديد" || "Add New Patient":
          cubit.innerFirstSelectedIndex = 1;
          cubit.data2 = S.of(context).AddNewPatient;
      }
    }
    cubit.changeIndexAndData(data, outerIndex);
  }

  static void showIDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SizedBox(
          child: AlertDialog(
            title: const Text('اضافه مورد جديد'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(),
                const SizedBox(
                  height: 24,
                ),
                const AuthTextField(
                  label: 'اسم المورد',
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'اغلاق',
                        ontap: () {
                          Navigator.pop(context);
                        },
                        buttonColor: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: CustomButton(
                        text: 'موافق',
                        ontap: () {
                          Navigator.pop(context);
                        },
                        buttonColor: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<DateTime?> showIpiker(
      BuildContext context, DateTime? dateTime) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: dateTime ?? DateTime.now(),
      lastDate: DateTime(2030),
    );
  }

  static showDetailsItem(BuildContext context,
      {required MedicineModel salesInventoryModelDetails}) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      showDragHandle: true,
      isScrollControlled: true,
      isDismissible: false,
      elevation: 5,
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // singlechild
                CustomDetailsItem(
                  note: 'كود الدواء',
                  data: salesInventoryModelDetails.barcode.toString(),
                  icon: Icons.window,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomDetailsItem(
                  note: 'الاسم العربي',
                  data: salesInventoryModelDetails.arabicname,
                  icon: Icons.ac_unit_rounded,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomDetailsItem(
                  note: 'الاسم الانجليزي',
                  data: salesInventoryModelDetails.englishname,
                  icon: Icons.abc,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomDetailsItem(
                  note: 'الماده الفعاله',
                  data: salesInventoryModelDetails.dosageform ?? 'null',
                  icon: Icons.not_accessible,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomDetailsItem(
                  note: 'الشركه المصنعه',
                  data: salesInventoryModelDetails.manufacturer,
                  icon: Icons.compare,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomDetailsItem(
                  note: 'نوع الدواء',
                  data: salesInventoryModelDetails.mediniceCategory.name,
                  icon: Icons.type_specimen,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomDetailsItem(
                  note: 'تركيز الدواء',
                  data: salesInventoryModelDetails.strength,
                  icon: Icons.type_specimen,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomDetailsItem(
                  note: 'التنبيه قبل',
                  data: salesInventoryModelDetails.alertexpired,
                  icon: Icons.type_specimen,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomDetailsItem(
                  note: 'التنبيه قبل',
                  data: salesInventoryModelDetails.alertamount.toString(),
                  icon: Icons.type_specimen,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static ShowPatientDetails(BuildContext context,
      {required PatientModel patientModel}) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      showDragHandle: true,
      isScrollControlled: true,
      isDismissible: false,
      elevation: 5,
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomDetailsItem(
                    note: 'اسم المريض',
                    data: patientModel.name,
                    icon: Icons.abc,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'الرقم القومي',
                    data: patientModel.national_id.toString(),
                    icon: Icons.type_specimen,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'الكلية',
                    data: patientModel.collegeName,
                    icon: Icons.calendar_view_week_rounded,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'الفرقة',
                    data: patientModel.level,
                    icon: Icons.unarchive,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'النوع',
                    data: patientModel.gender,
                    icon: Icons.man,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'رقم التليفون',
                    data: patientModel.phone_number,
                    icon: Icons.phone,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  patientModel.chronic
                      ? CustomDetailsItem(
                          note: 'الامراض',
                          data: patientModel.diseases
                              .map((disease) => disease.name)
                              .join(', '),
                          icon: Icons.coronavirus_rounded,
                        )
                      : const SizedBox(
                          height: 8,
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
