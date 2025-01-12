import 'package:flutter/material.dart';

class PrimaryButtons {
  static Widget primaryButton({
    required String text,
    required Function onPressed,
    Color? backgroundColor,
    Color? textColor,
    double? borderRadius,
    double? width,
    double? height,
  }) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 56,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.blue,
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.white,
        ),
      )),
    );
  }

  static Widget secondaryButton(
      {required String text,
      required Function onPressed,
      Color? backgroundColor,
      Color? textColor,
      double? borderRadius,
      double? width,
      double? height,
      double? borderWidth}) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 56,
      decoration: BoxDecoration(
        border: Border.all(
          color: backgroundColor ?? Colors.blue,
          width: borderWidth ?? 2,
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.white,
        ),
      )),
    );
  }
}
