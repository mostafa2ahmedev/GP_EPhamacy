import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit_State.dart';

import 'package:gppharmacy/Features/HomeScreen/presentation/Home_View.dart';
import 'package:gppharmacy/Utils/Shared_Prefrences.dart';
import 'package:gppharmacy/Utils/Themes.dart';

import 'package:gppharmacy/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  bool mode = await SharedPref.getData(key: 'Mode');
  bool lang = await SharedPref.getData(key: 'Lang');
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return GP_Pharmacy(
          mode: mode,
          lang: lang,
        );
      },
    ),
  );
}

class GP_Pharmacy extends StatelessWidget {
  const GP_Pharmacy({super.key, required this.mode, required this.lang});
  final bool mode;
  final bool lang;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerCubit(),
      child: BlocConsumer<DrawerCubit, DrawerStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              themeMode: mode ? ThemeMode.dark : ThemeMode.light,
              theme: Themes.lightThemeData,
              darkTheme: Themes.darkThemeData,
              locale: lang ? const Locale('en') : const Locale('ar'),
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
