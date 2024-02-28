import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit_State.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';

class CustomDrawerDropDownButton extends StatefulWidget {
  const CustomDrawerDropDownButton({
    super.key,
    required this.hint,
    required this.dropDownItems,
    required this.outerIndex,
  });

  final String hint;
  final List<String> dropDownItems;
  final int outerIndex;

  @override
  _CustomDrawerDropDownButtonState createState() =>
      _CustomDrawerDropDownButtonState();
}

class _CustomDrawerDropDownButtonState
    extends State<CustomDrawerDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubit, DrawerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<DrawerCubit>(context);
        return Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 2.5),
              child: Container(
                padding: const EdgeInsets.only(left: 12, right: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButton<String>(
                  iconEnabledColor: Theme.of(context).iconTheme.color,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                  underline: const SizedBox(),
                  hint: Text(
                    widget.hint,
                    style: AppStyles.styleRegular16(context),
                  ),
                  isExpanded: true,
                  style: AppStyles.styleBold16(context),
                  dropdownColor: Theme.of(context).cardColor,
                  value: widget.outerIndex == 0 ? cubit.data1 : cubit.data2,
                  items: MethodHelper.getDropDownItems(widget.dropDownItems),
                  onChanged: (value) {
                    if (cubit.data1 != value || cubit.data2 != value) {
                      MethodHelper.checkForTheIndex(widget.outerIndex, value,
                          context.read<DrawerCubit>());
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            )
          ],
        );
      },
    );
  }
}
