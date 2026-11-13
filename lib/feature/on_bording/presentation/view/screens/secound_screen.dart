import 'package:fit_volt/core/utils/app_assets.dart';
import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:fit_volt/core/common/custom_text_widget.dart';
import 'package:flutter/material.dart';

class SecoundScreen extends StatefulWidget {
  SecoundScreen({super.key});

  @override
  State<SecoundScreen> createState() => _SecoundScreenState();
}

class _SecoundScreenState extends State<SecoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .spaceEvenly,
      crossAxisAlignment: .center,
      children: [
        Image.asset(AppAssets.recordPanel, height: 300, fit: BoxFit.contain),

        Column(
          spacing: 12,
          children: [
            CustomTextWidget(
              data: "Track Your Workouts",
              fontSize: 28,
              color: AppColors.primaryTextColor,
              fontWeight: .w800,
            ),
            CustomTextWidget(
              data: 'Log every set, rep, and weight effortlessly with instant biometric analytics and real-time exercise feedback.',
              fontSize: 16,
              color: AppColors.secoundryTextColor,
              fontWeight: .normal,
            ),
          ],
        ),
      ],
    );
  }
}
