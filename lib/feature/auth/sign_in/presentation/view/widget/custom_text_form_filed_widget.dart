import 'package:fit_volt/core/common/custom_text_widget.dart';
import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:fit_volt/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class CustomTextFormFiledWidget extends StatelessWidget {
  CustomTextFormFiledWidget({
    super.key,
    required this.controller,
    required this.iconAssetPath,
    required this.textInputAction,
    required this.hintText,
    // required this.validator,
  });
  TextEditingController controller;
  TextInputAction textInputAction;
  // String? Function(String?)? validator;
  String iconAssetPath;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hint: CustomTextWidget(
          data: hintText,
          fontSize: 16,
          color: AppColors.hintTextColor,
          textAlign: .start,
        ),
        prefixIcon: Image.asset(iconAssetPath),
        filled: true,
        fillColor: AppColors.authButtonBackGround,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textInputAction: textInputAction,
      // validator: validator,
    );
  }
}
