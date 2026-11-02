import 'package:fit_volt/core/routes/app_routes.dart';
import 'package:fit_volt/core/utils/app_assets.dart';
import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:fit_volt/feature/on_bording/presentation/view/widgets/custom_navigate_button.dart';
import 'package:fit_volt/feature/on_bording/presentation/view/widgets/custom_onboarding_app_bar.dart';
import 'package:fit_volt/core/common/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomOnboardingAppBar(onSkip: () {}),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: 664,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: .spaceEvenly,
            crossAxisAlignment: .center,
            children: [
              Image.asset(
                AppAssets.reachYourGoal,
                height: 300,
                fit: BoxFit.contain,
              ),
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
              CustomNavigateButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.logInScreen);
                },
                data: "Get Started",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
