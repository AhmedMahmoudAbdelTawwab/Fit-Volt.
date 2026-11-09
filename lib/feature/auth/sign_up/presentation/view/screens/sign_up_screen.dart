import 'package:fit_volt/core/common/custom_text_widget.dart';
import 'package:fit_volt/core/routes/app_routes.dart';
import 'package:fit_volt/core/service_locator/service_locator.dart';
import 'package:fit_volt/core/utils/app_assets.dart';
import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:fit_volt/core/utils/app_icons.dart';
import 'package:fit_volt/core/utils/app_validator.dart';
import 'package:fit_volt/feature/auth/sign_up/presentation/view/widget/custom_create_emaill_button_widget.dart';
import 'package:fit_volt/feature/auth/sign_up/presentation/view/widget/custom_sign_up_button_widget.dart';
import 'package:fit_volt/feature/auth/sign_up/presentation/view/widget/custom_text_form_filed_widget.dart';
import 'package:fit_volt/feature/auth/sign_up/presentation/view_model/cubit/sign_up_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void dispose() {
    super.dispose();
    userNameController.dispose();
    userEmailController.dispose();
    userPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<SignUpCubit>()
        ..createAccount(
          email: userEmailController.text,
          password: userPasswordController.text,
        ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColors.backgroundColor,
          title: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.primaryTextColor,
              fontWeight: .w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  spacing: 15,
                  children: [
                    Image.asset(AppAssets.fitVoltLogo, height: 170, width: 170),

                    CustomTextWidget(
                      data: "Create Account",
                      fontSize: 28,
                      fontWeight: .w700,
                    ),
                    CustomTextWidget(
                      data: "Start your journey today and build yourultimate physique.",
                      fontSize: 16,
                    ),

                    SizedBox(
                      child: Column(
                        spacing: 4,
                        crossAxisAlignment: .start,
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
                            validator: AppValidator.validateName,
                          ),
                          CustomTextWidget(
                            data: "EMAIL",
                            fontSize: 12,
                            fontWeight: .w700,
                            color: AppColors.textFiledPrmaryColor,
                          ),
                          CustomTextFormFiledWidget(
                            hintText: "Please Enter Your Email",
                            controller: userEmailController,
                            iconAssetPath: AppIcons.userEmailIcon,
                            textInputAction: .next,
                            validator: AppValidator.validateEmail,
                          ),
                          CustomTextWidget(
                            data: "PASSWORD",
                            fontSize: 12,
                            fontWeight: .w700,
                            color: AppColors.textFiledPrmaryColor,
                          ),
                          CustomTextFormFiledWidget(
                            hintText: "***********",
                            controller: userPasswordController,
                            iconAssetPath: AppIcons.passwordIcon,
                            textInputAction: .next,
                            validator: AppValidator.validatePassword,
                          ),
                        ],
                      ),
                    ),

                    BlocListener<SignUpCubit, SignUpCubitState>(
                      listener: (context, state) {
                        if (state is SignUpCubitError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.messageError)),
                          );
                        }
                        if (state is SignUpCubitSuccess) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.welcome,
                            (route) => false,
                          );
                        }
                        if (state is SignUpCubitLodaing) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) =>
                                Center(child: CircularProgressIndicator()),
                          );
                        }
                      },
                      child: CustomCreateEmaillButtonWidget(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) ;
                          {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.welcome,
                              (route) => false,
                            );
                          }
                        },
                        data: "Create Account",
                      ),
                    ),

                    Row(
                      children: [
                        Expanded(child: Divider(color: AppColors.dividerColor)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: CustomTextWidget(
                            data: "OR SIGN UP WITH",
                            fontSize: 12,
                            fontWeight: .w700,
                            color: Color(0xff474746),
                          ),
                        ),
                        Expanded(child: Divider(color: AppColors.dividerColor)),
                      ],
                    ),
                    CustomSignUpButtonWidget(
                      onPressed: () {},
                      data: "Sign up with Google",
                      imageName: AppAssets.googleImage,
                    ),
                    CustomSignUpButtonWidget(
                      onPressed: () {},
                      data: "Sign up with Facebook",
                      imageName: AppAssets.facebookImage,
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
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.logInScreen,
                                );
                              },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
