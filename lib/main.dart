import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gppharmacy/Features/AddAccount/Presentation/AddAccountView.dart';


import 'package:gppharmacy/generated/l10n.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
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
    return MaterialApp(
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
        home:  AddAccountView());
  }
}
