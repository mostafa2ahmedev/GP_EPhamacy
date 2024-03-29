import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/CustomChoosenContainer.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/Home_View.dart';
import 'package:gppharmacy/Features/Notifications/presentation/Views/NotificationView.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/MedicineCubit/cubit/medicine_cubit.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';

class ChoosenView extends StatelessWidget {
  const ChoosenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Center(
              child: Text('صيدليه الطلبه',
                  style: AppStyles.styleBold28(context)
                      .copyWith(color: Colors.black)),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
            Text('حدد خيارا:',
                style: AppStyles.styleBold28(context)
                    .copyWith(color: Colors.black)),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                CustomChoosenContainer(
                  ontap: () {},
                  text: 'الاحصائيات',
                ),
                const SizedBox(
                  width: 2,
                ),
                CustomChoosenContainer(
                  ontap: () {
                    MethodHelper.navigateToWithRep(context, const HomeView());
                  },
                  text: 'الاداره',
                ),
                const SizedBox(
                  width: 2,
                ),
                CustomChoosenContainer(
                  ontap: () {
                    MethodHelper.navigateToWithRep(
                        context, const NotificationView());
                  },
                  text: 'الاشعارات',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
