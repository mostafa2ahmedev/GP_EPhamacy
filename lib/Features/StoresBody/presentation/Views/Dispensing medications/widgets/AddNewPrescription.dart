import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Patients/Maneger/Patient_Cubit.dart';
import 'package:gppharmacy/Features/Patients/Maneger/Patient_Cubit_State.dart';
import 'package:gppharmacy/Features/Patients/data/Patient_Model.dart';
import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/PrescriptionModel.dart';
import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/MedicineModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/Dispensing%20medicationsCubit/dispensing_medications_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/Utils/Widgets/CustomLoadingIndicator.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../../../Auth/Presentation/widgets/Auth_Text_Field.dart';
import '../../../../../Auth/Presentation/widgets/Custom_Button.dart';
import '../../../../data/DispensingMedications/prsPrescriptionCategory.dart';
import '../../../Maneger/OrdersCubit/Orders_Cubit.dart';

import '../../Orders/widgets/CustomMedicineView.dart';

class AddNewPrescription extends StatefulWidget {
  const AddNewPrescription({super.key});

  @override
  State<AddNewPrescription> createState() => _AddNewPrescriptionState();
}

class _AddNewPrescriptionState extends State<AddNewPrescription> {
  late TextEditingController nameController,
      nationalIdController,
      collegeController,
      levelController,
      phoneController,
      presIdController,
      diseaseController;
  late GlobalKey<FormState> key;
  String? chronicValue;
  String hint = 'اختر نوع الروشته';
  PatientModel? patientModel;
  TextEditingController typeAheadController = TextEditingController();
  List<MedicineModel> medicines = [];
  @override
  void initState() {
    super.initState();

    presIdController = TextEditingController();
    diseaseController = TextEditingController();
    key = GlobalKey();
    BlocProvider.of<OrdersCubit>(context).getSupplierData();
    BlocProvider.of<PateintCubit>(context).fetchAllPateint();
    BlocProvider.of<PateintCubit>(context).medicinesPrescription = [];
    BlocProvider.of<MedicineCubit>(context).getMedicineData(typeOfSearch: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PateintCubit, PateintCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is PatientLoadingState
              ? CustomLoadingIndicator()
              : SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("اضافه روشته جديده",
                                style: AppStyles.styleBold32(context)
                                    .copyWith(color: Colors.black)),
                            const SizedBox(
                              height: 12,
                            ),
                            Form(
                              key: key,
                              child: Column(
                                children: [
                                  CustomDropDownButton(
                                    isExpanded: true,
                                    items: const ['مزمن', 'طوارئ'],
                                    hint: hint,
                                    onChanged: (value) {
                                      setState(() {
                                        chronicValue = value!;
                                      });
                                    },
                                    value: chronicValue,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  AuthTextField(
                                    keyboardType: TextInputType.number,
                                    label: 'رقم الروشته',
                                    suffixIcon: const Icon(Icons.abc),
                                    validator: (data) {
                                      if (data == null || data.isEmpty) {
                                        return 'This field cannot be empty';
                                      }
                                      return null;
                                    },
                                    controller: presIdController,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Autocomplete<PatientModel>(
                                    optionsBuilder: (textEditingValue) {
                                      if (textEditingValue.text == "") {
                                        return Iterable<PatientModel>.empty();
                                      }

                                      return BlocProvider.of<PateintCubit>(
                                              context)
                                          .findPatients(textEditingValue.text);
                                    },
                                    displayStringForOption:
                                        (PatientModel patient) => patient.name,
                                    onSelected: (option) {
                                      setState(() {
                                        patientModel = option;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  AuthTextField(
                                    enabled: false,
                                    label: 'الرقم القومي',
                                    suffixIcon: const Icon(Icons.abc),
                                    validator: (data) {
                                      if (data == null || data.isEmpty) {
                                        return 'This field cannot be empty';
                                      }
                                      return null;
                                    },
                                    controller: TextEditingController(
                                        text: patientModel?.nationalId
                                            .toString()),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  AuthTextField(
                                    enabled: false,
                                    label: 'الكليه',
                                    suffixIcon: const Icon(Icons.abc),
                                    validator: (data) {
                                      if (data == null || data.isEmpty) {
                                        return 'This field cannot be empty';
                                      }
                                      return null;
                                    },
                                    controller: TextEditingController(
                                        text: patientModel?.collegeName),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  AuthTextField(
                                    enabled: false,
                                    label: 'رقم الهاتف',
                                    suffixIcon: const Icon(Icons.abc),
                                    validator: (data) {
                                      if (data == null || data.isEmpty) {
                                        return 'This field cannot be empty';
                                      }
                                      return null;
                                    },
                                    controller: TextEditingController(
                                        text: patientModel?.phoneNumber),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  AuthTextField(
                                    enabled: false,
                                    label: 'الفرقه الدراسيه',
                                    suffixIcon: const Icon(Icons.abc),
                                    validator: (data) {
                                      if (data == null || data.isEmpty) {
                                        return 'This field cannot be empty';
                                      }
                                      return null;
                                    },
                                    controller: TextEditingController(
                                        text: patientModel?.level),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  AuthTextField(
                                    enabled: false,
                                    controller: TextEditingController(
                                        text: patientModel?.diseases
                                            .map((e) => e.name)
                                            .toString()),
                                    label: 'التشخيص',
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
                                  if (state
                                      is AssignMedicineToPrescriptionListt)
                                    Column(
                                      children: List.generate(
                                          BlocProvider.of<PateintCubit>(context)
                                              .medicinesPrescription
                                              .length, (index) {
                                        return CustomMedicineViewForPres(
                                          medicineModel:
                                              BlocProvider.of<PateintCubit>(
                                                      context)
                                                  .medicinesPrescription[index],
                                          amount: 54,
                                        );
                                      }),
                                    ),
                                  MultiSelectDialogField<MedicineModel>(
                                    title: const Text("الادويه"),
                                    buttonText: const Text(
                                      "الادويه",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    buttonIcon: const Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: Colors.grey,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                    ),
                                    items: BlocProvider.of<MedicineCubit>(
                                            context)
                                        .medicinesList
                                        .map((e) =>
                                            MultiSelectItem(e, e.englishname))
                                        .toList(),
                                    listType: MultiSelectListType.CHIP,
                                    onConfirm: (values) {
                                      medicines = values;
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
                                            if (key.currentState!.validate() &&
                                                chronicValue != null) {
                                              BlocProvider.of<
                                                          DispensingMedicationsCubit>(
                                                      context)
                                                  .postPrescriptionData(
                                                prescriptionModel:
                                                    PrescriptionModel(
                                                  id: int.parse(
                                                      presIdController.text),
                                                  diagnosis: patientModel!
                                                      .diseases
                                                      .map((e) => e.name)
                                                      .toString(),
                                                  patientModel: patientModel!,
                                                  medicineModel: medicines,
                                                  prescriptionCategory:
                                                      PrsPrescriptionCategory(
                                                          id: chronicValue ==
                                                                  "مزمن"
                                                              ? 1
                                                              : 2,
                                                          name: chronicValue!),
                                                ),
                                              );
                                            }
                                          },
                                          buttonColor: Colors.green,
                                          child: Text(
                                            'اضافه روشته',
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
                                            setState(() {
                                              nameController.text = "";
                                              nationalIdController.text = "";
                                              collegeController.text = "";
                                              levelController.text = "";
                                              phoneController.text = "";
                                              presIdController.text = "";
                                              diseaseController.text = "";
                                            });
                                          },
                                          buttonColor: Colors.red,
                                          child: const Icon(Icons.remove),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ])),
                );
        },
      ),
    );
  }
}
  // addMedicineInPrescription(context,
  //                                               child:
  //                                                   const BodyOfAdditionMedicineInPrescription());