import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Text_Field.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/OrdersCubit/OrdersCubitStates.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/OrdersCubit/Orders_Cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/Orders/widgets/ListViewOfOrders.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Widgets/CustomDropDownButton.dart';
import 'package:gppharmacy/Utils/Widgets/CustomFailureWidget.dart';
import 'package:gppharmacy/Utils/Widgets/CustomLoadingIndicator.dart';
import 'package:gppharmacy/Utils/Widgets/CustomNoDataContainer.dart';
import 'package:gppharmacy/generated/l10n.dart';

class MobileImports extends StatefulWidget {
  const MobileImports({super.key});

  @override
  State<MobileImports> createState() => _MobileImportsState();
}

class _MobileImportsState extends State<MobileImports> {
  late TextEditingController controller;
  String wayOfSearch = "طلب الامداد";
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrdersCubit>(context).fetchAllOrders();
    controller = TextEditingController();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var orderCubit = BlocProvider.of<OrdersCubit>(context);
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).ViewOldOrders,
              style: AppStyles.styleBold32(context),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: AuthTextField(
                    onChanged: (value) {
                      orderCubit.searchOrders(value, wayOfSearch);
                    },
                    controller: controller,
                    label: 'ادخل $wayOfSearch',
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: CustomDropDownButton(
                    isExpanded: true,
                    items: const [
                      'طلب الامداد',
                      'اسم الدواء',
                    ],
                    hint: wayOfSearch,
                    onChanged: (value) {
                      setState(() {
                        wayOfSearch = value!;
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
            BlocBuilder<OrdersCubit, OrdersCubitStates>(
              builder: (context, state) {
                if (state is OrdersCubitFaulierStates) {
                  return const CustomFailureWidget();
                } else if (state is OrdersCubitSuccessStates) {
                  return ListViewOfOrders(
                    orders: orderCubit.searchedOrder,
                  );
                } else if (state is OrdersCubitLoadingStates) {
                  return const CustomLoadingIndicator();
                } else {
                  return const CustomNoDataContainer();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
