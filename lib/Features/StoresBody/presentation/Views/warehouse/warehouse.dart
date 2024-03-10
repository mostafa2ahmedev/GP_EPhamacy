import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';

import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/WareHouse/cubit/warehouse_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/warehouse/widgets/ListViewForWarehouse.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/generated/l10n.dart';

class Warehouse extends StatefulWidget {
  const Warehouse({super.key});

  @override
  State<Warehouse> createState() => _WarehouseState();
}

class _WarehouseState extends State<Warehouse> {
  String wayOfSearch = 'الباركود الخاص بالدواء';
  late TextEditingController controller;
  bool toggler = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).H3ohdeElm5zn,
            style: AppStyles.styleBold28(context),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: AuthTextField(
                  onChanged: (value) {
                    BlocProvider.of<WarehouseCubit>(context)
                        .searchingOnWarehouseList(
                            text: value, toggler: toggler);
                  },
                  label: 'ادخل $wayOfSearch',
                  controller: controller,
                  hintStyle: AppStyles.styleRegular16(context)
                      .copyWith(color: Colors.grey),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: CustomDropDownButton(
                  isExpanded: true,
                  items: const [
                    'الباركود الخاص بالدواء',
                    'اسم الدواء',
                  ],
                  hint: wayOfSearch,
                  onChanged: (value) {
                    setState(() {
                      wayOfSearch = value!;
                      if (value == 'اسم الدواء') {
                        toggler = true;
                      }
                    });
                  },
                  value: wayOfSearch,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const SizedBox(
            height: 24,
          ),
          BlocBuilder<WarehouseCubit, WarehouseState>(
            builder: (context, state) {
              if (state is GetWarehouseDataFailureState) {
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    decoration: BoxDecoration(
                      color: ColorManeger.lightPrimaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'عذرا حدث خطا ما يرجي المحاوله لاحقا',
                        style: AppStyles.styleBold16(context),
                      ),
                    ),
                  ),
                );
              } else if (state is GetWarehouseDataSuccessState) {
                return ListViewOfWareHouse(
                  searchedList:
                      BlocProvider.of<WarehouseCubit>(context).searchedList,
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}
