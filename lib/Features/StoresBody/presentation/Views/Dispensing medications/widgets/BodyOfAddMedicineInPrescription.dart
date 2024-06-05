import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Custom_Button.dart';
import 'package:gppharmacy/Features/Patients/Maneger/Patient_Cubit.dart';

import 'package:gppharmacy/Features/StoresBody/data/SalesInventory/MedicineModel.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';

class BodyOfAdditionMedicineInPrescription extends StatefulWidget {
  const BodyOfAdditionMedicineInPrescription({super.key});

  @override
  State<BodyOfAdditionMedicineInPrescription> createState() =>
      _BodyOfAdditionMedicineInPrescriptionState();
}

class _BodyOfAdditionMedicineInPrescriptionState
    extends State<BodyOfAdditionMedicineInPrescription> {
  late TextEditingController priceController;
  late TextEditingController manufactureController;

  late GlobalKey<FormState> key;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  MedicineModel? medicineModel;

  @override
  void initState() {
    super.initState();

    priceController = TextEditingController();
    manufactureController = TextEditingController();
    key = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<MedicineCubit, MedicineState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is GetMedicineDataLoadingState
              ? const Center(child: CircularProgressIndicator())
              : Form(
                  autovalidateMode: autovalidateMode,
                  key: key,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Autocomplete<MedicineModel>(
                        optionsBuilder: (textEditingValue) {
                          if (textEditingValue.text == "") {
                            return Iterable<MedicineModel>.empty();
                          }
                          return BlocProvider.of<MedicineCubit>(context)
                              .findMedicines(textEditingValue.text);
                          // return BlocProvider.of<PateintCubit>(context)
                          //     .findPatients(textEditingValue.text);
                        },
                        displayStringForOption: (MedicineModel medicine) =>
                            medicine.englishname,
                        onSelected: (option) {
                          setState(() {
                            medicineModel = option;
                          });
                        },
                      ),
                      AuthTextField(
                        controller: priceController,
                        label: "السعر",
                        suffixIcon: const Icon(Icons.add_rounded),
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
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              ontap: () {
                                if (key.currentState!.validate()) {
                                  BlocProvider.of<PateintCubit>(context)
                                      .assignMedicineToPrescriptionList(
                                          medicineModel: medicineModel!);
                                  Navigator.pop(context);
                                } else {
                                  setState(() {
                                    autovalidateMode = AutovalidateMode.always;
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
                                if (key.currentState!.validate()) {}
                                Navigator.pop(context);
                              },
                              buttonColor: Colors.red,
                              child: Text(
                                'تراجع',
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
      ),
    );
  }
}
