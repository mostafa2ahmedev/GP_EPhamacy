import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/AddAccount/Presentation/Views/widgets/Mobie_Add_Account_View.dart';
import 'package:gppharmacy/Features/AddAccount/data/cubit/add_account_cubit.dart';

import 'package:gppharmacy/Utils/AdaptiveLayout.dart';

class AddAccountView extends StatelessWidget {
  const AddAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAccountCubit(),
      child: Scaffold(
        body: AdaptiveLayout(
          mobileDashboard: (context) => const MobileAddAccountView(),
          tabletDashboard: (context) => const SizedBox(),
          desktopDashboard: (context) => const SizedBox(),
        ),
      ),
    );
  }
}
