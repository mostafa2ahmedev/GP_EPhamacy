import 'package:flutter/material.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';

class CustomNoMatchingData extends StatelessWidget {
  const CustomNoMatchingData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'عذرا لا يوجد اي بيانات تطابق ما تريد',
        style: AppStyles.styleSemiBold20(context)
            .copyWith(color: Theme.of(context).drawerTheme.backgroundColor),
      ),
    );
  }
}
