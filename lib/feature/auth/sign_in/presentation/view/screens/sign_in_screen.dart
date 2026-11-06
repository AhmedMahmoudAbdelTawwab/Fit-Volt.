import 'package:fit_volt/core/common/custom_text_widget.dart';
import 'package:fit_volt/core/routes/app_routes.dart';
import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:fit_volt/core/utils/app_icons.dart';
import 'package:fit_volt/core/utils/app_validator.dart';
import 'package:fit_volt/feature/auth/sign_in/presentation/view/widget/custom_text_form_filed_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          "Sign In",
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
            CustomTextWidget(
              data: "Create Account",
              fontSize: 28,
              fontWeight: .w700,
            ),
            CustomTextWidget(
              data: "Start your journey today and build yourultimate physique.",
              fontSize: 16,
            ),

            Container(
              child: Column(
                spacing: 4,
                mainAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  CustomTextWidget(
                    data: "FULL NAME",
                    fontSize: 12,
                    fontWeight: .w700,
                    color: AppColors.textFiledPrmaryColor,
                    textAlign: .start,
                  ),
                  CustomTextFormFiledWidget(
                    hintText: "Please Enter Your Name",
                    controller: userNameController,
                    iconAssetPath: AppIcons.userNameIcon,
                    textInputAction: .next,
                  ),
                  CustomTextWidget(
                    data: "EMAIL",
                    fontSize: 12,
                    fontWeight: .w700,
                    color: AppColors.textFiledPrmaryColor,
                  ),
                  CustomTextFormFiledWidget(
                    hintText: "Please Enter Your Email",
                    controller: userNameController,
                    iconAssetPath: AppIcons.userEmailIcon,
                    textInputAction: .next,
                  ),
                  CustomTextWidget(
                    data: "PASSWORD",
                    fontSize: 12,
                    fontWeight: .w700,
                    color: AppColors.textFiledPrmaryColor,
                  ),
                  CustomTextFormFiledWidget(
                    hintText: "***********",
                    controller: userNameController,
                    iconAssetPath: AppIcons.passwordIcon,
                    textInputAction: .next,
                  ),
                ],
              ),
            ),

            Text.rich(
              TextSpan(
                text: "Already have an account?",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.secoundryTextColor,
                ),
                children: [
                  TextSpan(
                    text: "Log In",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: .w700,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, AppRoutes.logInScreen);
                      },
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
