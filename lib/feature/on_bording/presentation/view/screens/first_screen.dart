import 'package:fit_volt/core/utils/app_assets.dart';
import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:fit_volt/core/common/custom_text_widget.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({super.key});
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .spaceEvenly,
      crossAxisAlignment: .center,
      children: [
        Container(
          height: 288,
          width: 288,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withValues(alpha: 0.25),
                spreadRadius: 5,
                blurRadius: 70,
              ),
            ],
            color: AppColors.backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Column(
            spacing: 5,
            mainAxisAlignment: .center,
            children: [
              SizedBox(height: 13),
              Image.asset(AppAssets.readyToStart),
              Image.asset(AppAssets.group4),
            ],
          ),
        ),

        Image.asset(AppAssets.maximumOutput),
        Column(
          children: [
            CustomTextWidget(
              data: "Push Your Limits",
              fontSize: 28,
              color: AppColors.primaryTextColor,
              fontWeight: .w800,
            ),
            CustomTextWidget(
              data: 'Ignite your athletic drive with personalized high-intensity workouts designed to shatter your personal records.',

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
