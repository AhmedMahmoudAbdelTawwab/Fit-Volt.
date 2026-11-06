import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextWidget extends StatelessWidget {
  CustomTextWidget({
    super.key,
    required this.data,
    required this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
  });
  String data;
  double fontSize;
  Color? color;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign ?? .center,
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? AppColors.primaryTextColor,
        fontWeight: fontWeight ?? .w400,
      ),
    );
  }
}
