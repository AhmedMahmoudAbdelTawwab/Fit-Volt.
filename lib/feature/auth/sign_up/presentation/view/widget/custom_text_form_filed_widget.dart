import 'package:fit_volt/core/common/custom_text_widget.dart';
import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormFiledWidget extends StatelessWidget {
  CustomTextFormFiledWidget({
    super.key,
    required this.controller,
    required this.iconAssetPath,
    required this.textInputAction,
    required this.hintText,
    required this.validator,
    this.obscureText,
    this.onPressedSuffixIcon,
    this.suffixIcon,
  });
  TextEditingController controller;
  TextInputAction textInputAction;
  String? Function(String?)? validator;
  void Function()? onPressedSuffixIcon;
  String iconAssetPath;
  String hintText;
  Widget? suffixIcon;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: AppColors.textFiledPrmaryColor),
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hint: CustomTextWidget(
          data: hintText,
          fontSize: 16,
          color: AppColors.hintTextColor,
          textAlign: .start,
        ),
        prefixIcon: Image.asset(iconAssetPath),
        suffixIcon: InkWell(
          enableFeedback: false,
          onTap: onPressedSuffixIcon ?? () {},
          child: suffixIcon ?? SizedBox.shrink(),
        ),
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
      validator: validator,
    );
  }
}
