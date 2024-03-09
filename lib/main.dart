import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gppharmacy/Features/Auth/Maneger/Auth_Cubit.dart';
import 'package:gppharmacy/Features/Auth/Presentation/Auth_View.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit.dart';
import 'package:gppharmacy/Features/HomeScreen/Maneger/Home_Cubit_State.dart';
import 'package:gppharmacy/Utils/DioService.dart';
import 'package:gppharmacy/Utils/Constant.dart';
import 'package:gppharmacy/Utils/Shared_Prefrences.dart';
import 'package:gppharmacy/Utils/Themes.dart';

import 'package:gppharmacy/generated/l10n.dart';

//
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  DioService.init();
  bool? mode = SharedPref.getData(key: Constant.themeConst);
  bool? lang = SharedPref.getData(key: Constant.langConst);
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

// 2- themes //
// 4- complete container ui```
// 5- retreive data ui
// 6- add

class GP_Pharmacy extends StatelessWidget {
  const GP_Pharmacy({super.key, required this.mode, required this.lang});
  final bool? mode;
  final bool? lang;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DrawerCubit()
            ..changeMode(mode: mode)
            ..changeLang(lang: lang),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: BlocConsumer<DrawerCubit, DrawerStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<DrawerCubit>(context);

          return MaterialApp(
            themeMode: cubit.selectedMode ? ThemeMode.dark : ThemeMode.light,
            theme: Themes.lightThemeData,
            darkTheme: Themes.darkThemeData,
            locale:
                cubit.selectedLang ? const Locale('en') : const Locale('ar'),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'GP_Pharmacy',
            home: const AuthView(),
          );
        },
      ),
    );
  }
}
