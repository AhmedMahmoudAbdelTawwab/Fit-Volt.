import 'package:fit_volt/core/routes/app_routes.dart';
import 'package:fit_volt/core/utils/app_assets.dart';
import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:fit_volt/feature/on_bording/presentation/view/widgets/custom_navigate_button.dart';
import 'package:fit_volt/feature/on_bording/presentation/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SizedBox(
            height: 664,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: .spaceEvenly,
              crossAxisAlignment: .center,
              children: [
                Image.asset(
                  AppAssets.recordPanel,
                  height: 300,
                  fit: BoxFit.contain,
                ),
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
                CustomNavigateButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.thirdScreen);
                    setState(() {});
                  },
                  data: "Next",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
