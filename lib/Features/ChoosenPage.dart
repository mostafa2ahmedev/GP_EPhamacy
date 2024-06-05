import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gppharmacy/Features/CustomChoosenContainer.dart';
import 'package:gppharmacy/Features/HomeScreen/presentation/Home_View.dart';
import 'package:gppharmacy/Features/Notifications/presentation/Views/NotificationView.dart';
import 'package:gppharmacy/Utils/AppStyles.dart';
import 'package:gppharmacy/Utils/App_Images.dart';
import 'package:gppharmacy/Utils/Methods_Helper.dart';

class ChoosenView extends StatelessWidget {
  const ChoosenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 100),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
                height: MediaQuery.sizeOf(context).width * 0.25,
                width: MediaQuery.sizeOf(context).width * 0.25,
                child: Image.asset(Assets.imagesBenhaLogo)),
          ),
          Row(
            children: [
              Expanded(
                child: Text('صيدليه الطلبه',
                    style: AppStyles.styleBold35(context)
                        .copyWith(color: Colors.black)),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          CustomChoosenContainer(
            ontap: () {},
            text: 'الاحصائيات',
          ),
          const SizedBox(
            height: 25,
          ),
          CustomChoosenContainer(
            ontap: () {
              MethodHelper.navigateTo(context, const HomeView());
            },
            text: 'الاداره',
          ),
          const SizedBox(
            height: 25,
          ),
          CustomChoosenContainer(
            ontap: () {
              MethodHelper.navigateTo(context, const NotificationView());
            },
            text: 'الاشعارات',
          ),
          Spacer()
        ]),
      ),
    );
  }
}
