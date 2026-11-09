import 'package:fit_volt/core/common/custom_text_widget.dart';
import 'package:fit_volt/core/routes/app_routes.dart';
import 'package:fit_volt/core/utils/app_assets.dart';
import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:fit_volt/feature/auth/log_in/presentation/view/widget/custom_log_in_button_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          "Log In",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.primaryTextColor,
            fontWeight: .w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 10,
          children: [
            Image.asset(AppAssets.fitVoltLogo, height: 170, width: 170),
            CustomTextWidget(data: "FITVOLT", fontSize: 28, fontWeight: .w800),
            Expanded(
              child: Column(
                spacing: 4,
                children: [
                  CustomTextWidget(
                    data: "Welcome Back",
                    fontSize: 28,
                    fontWeight: .w700,
                  ),
                  CustomTextWidget(
                    data: "Sign in to access your workout programs andhistory.",
                    fontSize: 16,
                    color: AppColors.secoundryTextColor,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                spacing: 16,
                children: [
                  CustomLogInButtonWidget(
                    onPressed: () {},
                    data: "Continue with Google",
                    imageName: AppAssets.googleImage,
                  ),
                  CustomLogInButtonWidget(
                    onPressed: () {},
                    data: "Continue with Facebook",
                    imageName: AppAssets.facebookImage,
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                spacing: 24,
                children: [
                  Row(
                    children: [
                      Expanded(child: Divider(color: AppColors.dividerColor)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CustomTextWidget(
                          data: "OR EMAIL",
                          fontSize: 12,
                          fontWeight: .w700,
                          color: Color(0xff474746),
                        ),
                      ),
                      Expanded(child: Divider(color: AppColors.dividerColor)),
                    ],
                  ),

                  Image.asset(AppAssets.workoutStutas),
                  Text.rich(
                    TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.secoundryTextColor,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primaryColor,
                            fontWeight: .w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.signUpScreen,
                              );
                              setState(() {});
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
