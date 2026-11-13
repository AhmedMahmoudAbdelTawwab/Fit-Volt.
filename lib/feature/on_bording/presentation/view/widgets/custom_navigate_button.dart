import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:fit_volt/core/common/custom_text_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomNavigateButton extends StatelessWidget {
  CustomNavigateButton({
    super.key,
    required this.onPressed,
    required this.data,
  });
  String data;
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
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: .center,
          spacing: 5,
          children: [
            CustomTextWidget(
              data: data,
              fontSize: 16,
              color: AppColors.backgroundColor,
              fontWeight: .w700,
            ),

            Icon(Icons.arrow_circle_right_outlined),
          ],
        ),
      ),
    );
  }
}
