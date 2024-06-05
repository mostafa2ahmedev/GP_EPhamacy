import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gppharmacy/Features/Auth/Maneger/Auth_Cubit_State.dart';

void toastMessage(String message, Color backgroundcolor) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundcolor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
