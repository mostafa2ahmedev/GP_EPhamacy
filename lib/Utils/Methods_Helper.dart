import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/ExecuseView/data/ExecuseModel.dart';
import 'package:gppharmacy/Features/ExecuseView/data/cubit/execuse_colleges_cubit.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';
import 'package:gppharmacy/Features/Patients/data/Patient_Model.dart';
import 'package:gppharmacy/Features/StoresBody/data/CollegesList/CollegesListModel.dart';
import 'package:gppharmacy/Features/StoresBody/data/Orders/OrderMedicine_Model.dart';
import 'package:gppharmacy/Features/StoresBody/data/Orders/Order_Model.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/MedicineModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Orders/widgets/AddNewImports.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Orders/widgets/CustomMedicineView.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/widgets/CustomDetailsItem.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
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
        case "الاحصائيات":
          cubit.innerFirstSelectedIndex = 0;
          cubit.data1 = S.of(context).HomeDashboard;
          break;
        case "حصر المبيعات" || "Sales inventory":
          cubit.innerFirstSelectedIndex = 1;
          cubit.data1 = S.of(context).HsrElmbe3at;
          break;
        case "الادويه" || "Medicines":
          cubit.innerFirstSelectedIndex = 2;
          cubit.data1 = S.of(context).Medicines;
          BlocProvider.of<MedicineCubit>(context).resetState();
          break;
        case "عهدة المخزن" || "3ohdeElm5zn":
          cubit.innerFirstSelectedIndex = 3;
          cubit.data1 = S.of(context).H3ohdeElm5zn;
          break;
        case "الواردات" || "Imports":
          cubit.innerFirstSelectedIndex = 4;
          cubit.data1 = S.of(context).Imports;
          break;
        case "حصر الكليات" || "Colleges inventory":
          cubit.innerFirstSelectedIndex = 5;
          cubit.data1 = S.of(context).HsrElkolyat;
          break;
        case "صرف الادويه" || "SrfEladwya":
          cubit.innerFirstSelectedIndex = 6;
          cubit.data1 = S.of(context).SrfEladwya;
          break;
        case "عرض الاذونات":
          cubit.innerFirstSelectedIndex = 7;
          cubit.data1 = S.of(context).ExecuseView;
          break;
      }
      cubit.data2 = null;
    } else if (outerIndex == 1) {
      cubit.outerSelectedIndex = 1;
      switch (data) {
        case "جميع المرضي" || "All Patient":
          cubit.innerSecondSelectedIndex = 0;
          cubit.data2 = S.of(context).AllPatient;
          break;
        case "اضافه مريض جديد" || "Add New Patient":
          cubit.innerSecondSelectedIndex = 1;
          cubit.data2 = S.of(context).AddNewPatient;
      }
      cubit.data1 = null;
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
                    icon: Icons.qr_code,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'الاسم العربي',
                    data: medicineModel.arabicname,
                    icon: Icons.medication_outlined,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'الاسم الانجليزي',
                    data: medicineModel.englishname,
                    icon: Icons.medication,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'الماده الفعاله',
                    data: medicineModel.dosageform == ''
                        ? 'لا يوجد'
                        : medicineModel.dosageform!,
                    icon: Icons.medical_information,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'الشركه المصنعه',
                    data: medicineModel.manufacturer == ""
                        ? "لايوجد"
                        : medicineModel.manufacturer!,
                    icon: Icons.apartment,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'نوع الدواء',
                    data: medicineModel.mediniceCategory.name,
                    icon: FontAwesomeIcons.pills,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'تركيز الدواء',
                    data: medicineModel.strength == ''
                        ? 'لا يوجد'
                        : medicineModel.strength!,
                    icon: FontAwesomeIcons.zero,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'التنبيه قبل',
                    data: medicineModel.alertexpired.toString() + " ايام",
                    icon: Icons.alarm,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'التنبيه قبل',
                    data: medicineModel.alertamount.toString() + " مخزون",
                    icon: Icons.date_range,
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

  static showDetailsPermession(BuildContext context,
      {required UsageColleges usageCollege,
      required List<UsageColleges> usageList}) {
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
                    note: 'رقم اذن الصرف',
                    data: usageCollege.id.toString(),
                    icon: Icons.qr_code,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'الاسم الكليه',
                    data: usageCollege.collegeName.toString(),
                    icon: Icons.medication_outlined,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDetailsItem(
                    note: 'تاريخ الصرف',
                    data: usageCollege.date.toString(),
                    icon: Icons.medication_outlined,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomMedicineView3(
                      usageCollege: usageCollege.collegeUseageMedicines!),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "السعر الكلي",
                        style: AppStyles.styleBold20(context)
                            .copyWith(color: Colors.black),
                      ),
                      Container(
                        color: Theme.of(context).drawerTheme.backgroundColor,
                        child: Text(
                          usageCollege.totalPrice.toString(),
                          style: AppStyles.styleBold20(context)
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
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
                    data: patientModel.phoneNumber ?? "",
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

  static void showToast({required String message, required bool type}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: type ? Colors.green : Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        CustomDetailsItem(
                          note: 'طلب الامداد',
                          data: ordermodel.supplyrequest.toString(),
                          icon: Icons.numbers_outlined,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomDetailsItem(
                          note: 'اذن التسليم',
                          data: ordermodel.deliveryrequest.toString(),
                          icon: Icons.receipt,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomDetailsItem(
                          note: 'تاريخ التوريد',
                          data: ordermodel.dateofsupply,
                          icon: Icons.date_range,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomDetailsItem(
                          note: 'اسم المورد',
                          data: ordermodel.supplier.name,
                          icon: Icons.person_2,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomCustom(
                          orderMedicinesModel: ordermodel,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static showSelectedCheckBox(BuildContext context) {
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
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [],
              ),
            ),
          );
        });
  }
}

class CustomCustom extends StatefulWidget {
  const CustomCustom({Key? key, required this.orderMedicinesModel})
      : super(key: key);

  final OrderModel orderMedicinesModel;

  @override
  State<CustomCustom> createState() => _CustomCustomState();
}

class _CustomCustomState extends State<CustomCustom> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<String> medicineList = widget.orderMedicinesModel.orderMedicines
        .map((e) => e.medicine.englishname)
        .toList();

    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 12),
              child: Material(
                child: Text(
                  " الادويه المضافه ف الطلبيه ",
                  style: AppStyles.styleBold20(context)
                      .copyWith(color: Colors.grey.shade900),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            CustomDropDownButton(
              items: medicineList,
              hint: "الادويه",
              onChanged: (value) {
                setState(() {
                  index = medicineList.indexOf(value!);
                });
              },
              value: medicineList.isNotEmpty ? medicineList[index] : null,
            ),
          ],
        ),
        CustomCustom2(
          orderMedicinesModel: medicineList.isNotEmpty
              ? widget.orderMedicinesModel.orderMedicines[index]
              : null,
        )
      ],
    );
  }
}

class CustomCustom2 extends StatelessWidget {
  const CustomCustom2({Key? key, required this.orderMedicinesModel})
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

class CustomMedicineView3 extends StatefulWidget {
  const CustomMedicineView3({super.key, required this.usageCollege});
  final List<CollegeUseageMedicines> usageCollege;

  @override
  State<CustomMedicineView3> createState() => _CustomMedicineView3State();
}

class _CustomMedicineView3State extends State<CustomMedicineView3> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> medicineNames = widget.usageCollege
        .map((e) => e.inventory!.orderMedicinesModel.medicine.englishname)
        .toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Material(
                  child: Text(
                    "الادويه المضافه في الاذن",
                    style: AppStyles.styleBold20(context)
                        .copyWith(color: Colors.grey.shade900),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: CustomDropDownButton2(
                  items: medicineNames,
                  hint: "الادويه",
                  onChanged: (value) {
                    setState(() {
                      selectedIndex = medicineNames.indexOf(value!);
                    });
                  },
                  value: medicineNames.isNotEmpty
                      ? medicineNames[selectedIndex]
                      : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (widget.usageCollege.isNotEmpty)
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.green),
                  child: CustomDetailsItemm(
                    note: 'الدواء',
                    data: widget.usageCollege[selectedIndex].inventory!
                        .orderMedicinesModel.medicine.englishname,
                    icon: Icons.medication_outlined,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.green),
                  child: CustomDetailsItemm(
                    note: 'كود الدواء',
                    data: widget.usageCollege[selectedIndex].inventory!
                        .orderMedicinesModel.medicine.barcode
                        .toString(),
                    icon: Icons.medication_outlined,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.green),
                  child: CustomDetailsItemm(
                    note: 'السعر',
                    data: widget.usageCollege[selectedIndex].inventory!
                        .orderMedicinesModel.price
                        .toString(),
                    icon: Icons.medication_outlined,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.green),
                  child: CustomDetailsItemm(
                    note: 'الكميه',
                    data: widget.usageCollege[selectedIndex].amount.toString(),
                    icon: Icons.medication_outlined,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
        ],
      ),
    );
  }
}
