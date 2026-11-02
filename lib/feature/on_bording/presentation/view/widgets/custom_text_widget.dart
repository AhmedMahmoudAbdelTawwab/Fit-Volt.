import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextWidget extends StatelessWidget {
  CustomTextWidget({
    super.key,
    required this.data,
    required this.fontSize,
    required this.color,
    required this.fontWeight,
  });
  String data;
  double fontSize;
  Color color;
  FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: .center,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
