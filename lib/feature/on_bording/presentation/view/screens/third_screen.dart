import 'package:fit_volt/core/utils/app_assets.dart';
import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:fit_volt/core/common/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .spaceEvenly,
      crossAxisAlignment: .center,
      children: [
        Image.asset(AppAssets.reachYourGoal, height: 300, fit: BoxFit.contain),
        Column(
          spacing: 12,
          children: [
            CustomTextWidget(
              data: "Reach Your Goals",
              fontSize: 28,
              color: AppColors.primaryTextColor,
              fontWeight: .w800,
            ),
            CustomTextWidget(
              data: 'Stay committed with custom training regimens and milestones engineered to build lasting strength.',
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
