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
import 'package:fit_volt/feature/auth/sign_up/presentation/view_model/cubit/hiding_password_cubit.dart';
import 'package:fit_volt/feature/auth/sign_up/presentation/view_model/cubit_create_account/sign_up_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final HidingPasswordCubit _hidingPasswordCubit = HidingPasswordCubit();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _hidingPasswordCubit.close();
    userNameController.dispose();
    userEmailController.dispose();
    userPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              BlocProvider<SignUpCubit>(
                create: (context) => serviceLocator<SignUpCubit>(),
                child: Column(
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
                          BlocBuilder<HidingPasswordCubit, bool>(
                            bloc: _hidingPasswordCubit,
                            builder: (context, state) {
                              return CustomTextFormFiledWidget(
                                hintText: "***********",
                                controller: userPasswordController,
                                iconAssetPath: AppIcons.passwordIcon,
                                textInputAction: .done,
                                validator: AppValidator.validatePassword,
                                obscureText: state,
                                onPressedSuffixIcon: () {
                                  if (state == true) {
                                    _hidingPasswordCubit.changePassword();
                                  } else {
                                    _hidingPasswordCubit.changePassword();
                                  }
                                },
                                suffixIcon: SizedBox(
                                  child: state
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    BlocConsumer<SignUpCubit, SignUpCubitState>(
                      listener: (context, state) {
                        if (state is SignUpCubitSuccess) {
                          Navigator.pushNamed(context, AppRoutes.profileSetup);
                        }
                        if (state is SignUpCubitError) {
                          toastification.show(
                            type: .error,
                            style: .fillColored,
                            autoCloseDuration: Duration(seconds: 3),
                            title: CustomTextWidget(
                              data: state.messageError,
                              fontSize: 12,
                            ),
                            direction: TextDirection.ltr,
                            animationDuration: const Duration(
                              milliseconds: 500,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is SignUpCubitLodaing) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return CustomCreateEmaillButtonWidget(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<SignUpCubit>().createAccount(
                                email: userEmailController.text,
                                password: userPasswordController.text,
                                name: userNameController.text,
                              );
                            }
                          },
                          data: "Create Account",
                        );
                      },
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
                    BlocConsumer<SignUpCubit, SignUpCubitState>(
                      builder: (context, state) {
                        if (state is SignUpCubitLodaing) {
                          return CircularProgressIndicator();
                        }
                        return CustomSignUpButtonWidget(
                          onPressed: () {
                            context.read<SignUpCubit>().signUpwithGoogle();
                          },
                          data: "Sign up with Google",
                          imageName: AppAssets.googleImage,
                        );
                      },
                      listener: (context, state) {
                        if (state is SignUpCubitSuccess) {
                          Navigator.pushNamed(context, AppRoutes.profileSetup);
                        }
                        if (state is SignUpCubitError) {
                          toastification.show(
                            type: .error,
                            style: .fillColored,
                            autoCloseDuration: Duration(seconds: 3),
                            title: CustomTextWidget(
                              data: state.messageError,
                              fontSize: 12,
                            ),
                            direction: TextDirection.ltr,
                            animationDuration: const Duration(
                              milliseconds: 500,
                            ),
                          );
                        }
                      },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
