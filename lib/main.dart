import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit_State.dart';

import 'package:gppharmacy/Features/HomeScreen/presentation/Home_View.dart';
import 'package:gppharmacy/Utils/Color_Maneger.dart';
import 'package:gppharmacy/Utils/Themes.dart';

import 'package:gppharmacy/generated/l10n.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return const GP_Pharmacy();
      },
    ),
  );
}

class GP_Pharmacy extends StatelessWidget {
  const GP_Pharmacy({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerCubit(),
      child: BlocConsumer<DrawerCubit, DrawerStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var mode = BlocProvider.of<DrawerCubit>(context).selectedMode;
          return MaterialApp(
              themeMode: mode ? ThemeMode.dark : ThemeMode.light,
              darkTheme: Themes.lightThemeData,
              theme: Themes.darkThemeData,
              locale: const Locale('ar'),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: 'Flutter Demo',
              home: const HomeView());
        },
      ),
    );
  }
}
