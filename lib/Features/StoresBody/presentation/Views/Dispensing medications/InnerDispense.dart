import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/PrescriptionModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/Dispensing%20medicationsCubit/dispensing_medications_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/Dispensing%20medicationsCubit/dispensing_medications_state.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/SalesInventory/widgets/CustomDetailsItem.dart';
import 'package:gppharmacy/Utils/Widgets/CustomFailureWidget.dart';

import 'package:gppharmacy/generated/l10n.dart';

import '../../../../../Utils/AppStyles.dart';

class InnerDispense extends StatefulWidget {
  const InnerDispense({super.key, required this.prescriptionModel});
  final PrescriptionModel prescriptionModel;

  @override
  State<InnerDispense> createState() => _InnerDispenseState();
}

class _InnerDispenseState extends State<InnerDispense> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DispensingMedicationsCubit>(context)
        .getALLMedicineForPrescrptionInInventory(
            prescriptionModel: widget.prescriptionModel);
    BlocProvider.of<DispensingMedicationsCubit>(context).totalAmount = 0;
  }

  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                Text(
                  S.of(context).SrfEladwya,
                  style: AppStyles.styleBold32(context),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<DispensingMedicationsCubit>(context)
                        .totalAmount = 0;
                    _dispenseMedicines(context);
                  },
                  child: const Text(
                    "صرف",
                    style: TextStyle(fontSize: 25),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            CustomDetailsItem(
              note: "رقم الروشته",
              data: widget.prescriptionModel.id.toString(),
              icon: Icons.abc,
            ),
            const SizedBox(height: 10),
            CustomDetailsItem(
              note: "التشخيص",
              data: widget.prescriptionModel.diagnosis ?? "",
              icon: Icons.abc,
            ),
            const SizedBox(height: 10),
            CustomDetailsItem(
              note: "اسم المريض",
              data: widget.prescriptionModel.patientModel.name,
              icon: Icons.abc,
            ),
            const SizedBox(height: 10),
            CustomDetailsItem(
              note: "نوع الروشته",
              data: widget.prescriptionModel.prescriptionCategory.name,
              icon: Icons.abc,
            ),
            Expanded(
              child: ListView.separated(
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
                          data: widget.prescriptionModel.medicineModel[index]
                              .englishname,
                          icon: Icons.type_specimen,
                        ),
                        CustomDetailsItem(
                          note: 'الباركود',
                          data: widget
                              .prescriptionModel.medicineModel[index].barcode
                              .toString(),
                          icon: Icons.type_specimen,
                        ),
                        const CustomDetailsItem(
                          note: 'الصلاحيه',
                          data: "",
                          icon: Icons.type_specimen,
                        ),
                        CustomDetailsItem(
                          note: 'الشركه المصنعه',
                          data: widget.prescriptionModel.medicineModel[index]
                                  .manufacturer ??
                              "",
                          icon: Icons.type_specimen,
                        ),
                        const CustomDetailsItem(
                          note: 'السعر',
                          data: "",
                          icon: Icons.type_specimen,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                itemCount: widget.prescriptionModel.medicineModel.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _dispenseMedicines(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceBetween,
          title: const Text("صرف الروشته"),
          content: BlocConsumer<DispensingMedicationsCubit,
              DispensingMedicationsState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = BlocProvider.of<DispensingMedicationsCubit>(context);
              return state is GetInventorySalesPrescriptionLoadingState
                  ? Center(child: CircularProgressIndicator())
                  : state is GetInventorySalesPrescriptionFailureState
                      ? CustomFailureWidget()
                      : state is NoDataInList
                          ? Text(
                              "لا يوجد اي ادويه ف المخزن",
                              style: TextStyle(color: Colors.red),
                            )
                          : Container(
                              width: double.maxFinite,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SingleChildScrollView(
                                    child: SizedBox(
                                      height: 200,
                                      child: ListView.builder(
                                        itemCount: cubit.inventorys.length,
                                        itemBuilder: (context, outerIndex) {
                                          return OuterListItem(
                                              outerIndex: outerIndex,
                                              state: state);
                                        },
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(" الاجمالي"),
                                      Text(BlocProvider.of<
                                                  DispensingMedicationsCubit>(
                                              context)
                                          .totalAmount
                                          .toString())
                                    ],
                                  ),
                                  Text("الحد الاقصي للصرف هو 350 جنيه")
                                ],
                              ),
                            );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text('صرف'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('اغلاق'),
            ),
          ],
        );
      },
    );
  }
}

class OuterListItem extends StatefulWidget {
  const OuterListItem({Key? key, required this.outerIndex, required this.state})
      : super(key: key);

  final int outerIndex;
  final DispensingMedicationsState state;
  @override
  _OuterListItemState createState() => _OuterListItemState();
}

class _OuterListItemState extends State<OuterListItem> {
  int? selectedRadioValue;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DispensingMedicationsCubit>(context);
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cubit.inventorys[widget.outerIndex][0].orderMedicinesModel.medicine
                .englishname,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(height: 4);
            },
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cubit.inventorys[widget.outerIndex].length,
            itemBuilder: (context, innerIndex) {
              return CustomItemWidget(
                price: cubit.inventorys[widget.outerIndex][innerIndex]
                    .orderMedicinesModel.price
                    .toString(),
                quantity: ((cubit.inventorys[widget.outerIndex][innerIndex]
                            .orderMedicinesModel.amount) -
                        (cubit.inventorys[widget.outerIndex][innerIndex]
                                .amount ??
                            0))
                    .toString(),
                value: innerIndex,
                groupValue: selectedRadioValue,
                ontap: (value) {
                  setState(() {
                    selectedRadioValue = value;
                    print(value);
                  });
                },
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          AuthTextField(
            keyboardType: TextInputType.number,
            label: "الكميه",
            onChanged: (data) {
              if (data == "") {
                cubit.totalAmount = 0;
                cubit.changeAmount();
              }
              if (cubit.inventorys[widget.outerIndex][selectedRadioValue!]
                      .orderMedicinesModel.price ==
                  0) {
                cubit.totalAmount = cubit
                    .inventorys[widget.outerIndex][selectedRadioValue!]
                    .orderMedicinesModel
                    .price;
              }

              cubit.changeAmount();
            },
          ),
        ],
      ),
    );
  }
}

class CustomItemWidget extends StatelessWidget {
  const CustomItemWidget({
    required this.price,
    required this.quantity,
    required this.value,
    required this.groupValue,
    required this.ontap,
  });

  final String price;
  final String quantity;
  final int value;
  final int? groupValue;
  final void Function(int?)? ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'السعر: $price',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'الكمية المتاحة: h $quantity',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Spacer(),
          Radio<int>(
            value: value,
            groupValue: groupValue,
            onChanged: ontap,
          ),
        ],
      ),
    );
  }
}
