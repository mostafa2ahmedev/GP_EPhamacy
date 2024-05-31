import 'package:flutter/material.dart';

import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';
import 'package:gppharmacy/Features/Patients/data/Patient_Model.dart';
import 'package:gppharmacy/Features/StoresBody/data/Orders/OrderMedicine_Model.dart';
import 'package:gppharmacy/Features/StoresBody/data/Orders/Order_Model.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/MedicineModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/widgets/CustomDetailsItem.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';

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
                        ontap: () {
                          Navigator.pop(context);
                        },
                        buttonColor: Colors.red,
                        child: Text(
                          'اغلاق',
                          style: AppStyles.styleMeduim16(context)
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: CustomButton(
                        ontap: () {
                          Navigator.pop(context);
                        },
                        buttonColor: Colors.red,
                        child: Text(
                          'موافق',
                          style: AppStyles.styleMeduim16(context)
                              .copyWith(color: Colors.white),
                        ),
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
      {required MedicineModel medicineModel}) {
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
                  // singlechild
                  CustomDetailsItem(
                    note: 'كود الدواء',
                    data: medicineModel.barcode.toString(),
                    icon: Icons.window,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'الاسم العربي',
                    data: medicineModel.arabicname,
                    icon: Icons.ac_unit_rounded,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'الاسم الانجليزي',
                    data: medicineModel.englishname,
                    icon: Icons.abc,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'الماده الفعاله',
                    data: medicineModel.dosageform == ''
                        ? 'لا يوجد'
                        : medicineModel.dosageform!,
                    icon: Icons.not_accessible,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'الشركه المصنعه',
                    data: medicineModel.manufacturer == ""
                        ? "لايوجد"
                        : medicineModel.manufacturer!,
                    icon: Icons.compare,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'نوع الدواء',
                    data: medicineModel.mediniceCategory.name,
                    icon: Icons.type_specimen,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'تركيز الدواء',
                    data: medicineModel.strength == ''
                        ? 'لا يوجد'
                        : medicineModel.strength!,
                    icon: Icons.type_specimen,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'التنبيه قبل',
                    data: medicineModel.alertexpired.toString(),
                    icon: Icons.type_specimen,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'التنبيه قبل',
                    data: medicineModel.alertamount.toString(),
                    icon: Icons.type_specimen,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
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
                    data: patientModel.nationalId.toString(),
                    icon: Icons.type_specimen,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'الرقم الجامعي',
                    data: patientModel.studentId.toString(),
                    icon: Icons.phone,
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
                    data: patientModel.phoneNumber,
                    icon: Icons.phone,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'السن',
                    data: patientModel.age.toString(),
                    icon: Icons.phone,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'نوع المرض',
                    data: patientModel.chronic ? "مزمن" : "غير مزمن",
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

  static ShowOrderDetails(BuildContext context,
      {required OrderModel ordermodel}) {
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
                CustomDetailsItem(
                  note: 'طلب الامداد',
                  data: ordermodel.supplyrequest.toString(),
                  icon: Icons.abc,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomDetailsItem(
                  note: 'اذن التسليم',
                  data: ordermodel.deliveryrequest.toString(),
                  icon: Icons.type_specimen,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomDetailsItem(
                  note: 'تاريخ التوريد',
                  data: ordermodel.dateofsupply,
                  icon: Icons.abc,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomDetailsItem(
                  note: 'اسم المورد',
                  data: ordermodel.supplier.name,
                  icon: Icons.type_specimen,
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: ordermodel.orderMedicines.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          children: [
                            Text(
                              "${index + 1}",
                              style: const TextStyle(fontSize: 20),
                            ),
                            CustomDetailsItem(
                              note: 'الدواء',
                              data: ordermodel
                                  .orderMedicines[index].medicine.englishname,
                              icon: Icons.type_specimen,
                            ),
                            CustomDetailsItem(
                              note: 'الكميه',
                              data: ordermodel.orderMedicines[index].amount
                                  .toString(),
                              icon: Icons.type_specimen,
                            ),
                            CustomDetailsItem(
                              note: 'الصلاحيه',
                              data: ordermodel.orderMedicines[index].expirydate,
                              icon: Icons.type_specimen,
                            ),
                            CustomDetailsItem(
                              note: 'اسم المورد',
                              data: ordermodel.supplier.name,
                              icon: Icons.type_specimen,
                            ),
                            CustomDetailsItem(
                              note: 'السعر',
                              data: ordermodel.orderMedicines[index].price
                                  .toString(),
                              icon: Icons.type_specimen,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
