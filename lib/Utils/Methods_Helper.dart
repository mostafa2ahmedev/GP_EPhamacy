import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';

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
    int outerIndex,
    String? data,
    DrawerCubit cubit,
  ) {
    if (outerIndex == 0) {
      cubit.outerSelectedIndex = 0;
      switch (data) {
        case 'حصر المبيعات':
          cubit.innerFirstSelectedIndex = 0;
          cubit.data1 = 'حصر المبيعات';
          break;
        case 'الأدويه':
          cubit.innerFirstSelectedIndex = 1;
          cubit.data1 = 'الأدويه';
          break;
        case 'عهده المخزن':
          cubit.innerFirstSelectedIndex = 2;
          cubit.data1 = 'عهده المخزن';
          break;
        case 'الواردات':
          cubit.innerFirstSelectedIndex = 3;
          cubit.data1 = 'الواردات';
          break;
        case 'حصر الكليات':
          cubit.innerFirstSelectedIndex = 4;
          cubit.data1 = 'حصر الكليات';
          break;
        case 'صرف الادويه':
          cubit.innerFirstSelectedIndex = 5;
          cubit.data1 = 'صرف الادويه';
          break;
      }
    } else if (outerIndex == 1) {
      cubit.outerSelectedIndex = 1;
      switch (data) {
        case 'جميع المرضي':
          cubit.innerFirstSelectedIndex = 0;
          cubit.data2 = 'جميع المرضي';
          break;
        case 'اضافه مريض جديد':
          cubit.innerFirstSelectedIndex = 1;
          cubit.data2 = 'اضافه مريض جديد';
      }
    }
    cubit.changeIndexAndData(data, outerIndex);
  }
}
