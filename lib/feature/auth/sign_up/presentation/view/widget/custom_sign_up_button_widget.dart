import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:fit_volt/core/common/custom_text_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSignUpButtonWidget extends StatelessWidget {
  CustomSignUpButtonWidget({
    super.key,
    required this.onPressed,
    required this.data,
    required this.imageName,
  });
  String data;
  String imageName;
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      enableFeedback: false,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      child: Container(
        height: 56,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.authButtonBackGround,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: .center,

          spacing: 18,
          children: [
            Image.asset(imageName, height: 24, width: 24),
            CustomTextWidget(data: data, fontSize: 16, fontWeight: .w700),
          ],
        ),
      ),
    );
  }
}
