
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'my_colors.dart';

class CustomToast {
  static failToast(
      {Color? bgcolor, Color? textColor, String? msg, len, gravity}) {
    return Fluttertoast.showToast(
      backgroundColor: bgcolor ?? Colors.red,
      textColor: textColor ?? Colors.white,
      msg: msg!,
      toastLength: len ?? Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM, // location// duration
    );
  }

  static successToast(
      {Color? bgcolor, Color? textColor, String? msg, len, gravity}) {
    return Fluttertoast.showToast(
      backgroundColor: bgcolor ?? Colors.black,
      textColor: textColor ?? Colors.white,
      msg: msg!,
      toastLength: len ?? Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM, // location// duration
    );
  }

  static serverErrorToast(
      {Color? bgcolor, Color? textColor, String? msg, len, gravity}) {
    return Fluttertoast.showToast(
      backgroundColor: bgcolor ?? MyColors.red500,
      textColor: textColor ?? MyColors.white,
      msg: "Server unavailable",
      toastLength: len ?? Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM, // location// duration
    );
  }
}
