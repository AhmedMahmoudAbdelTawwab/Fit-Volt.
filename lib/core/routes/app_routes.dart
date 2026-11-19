import 'package:fit_volt/feature/auth/log_in/presentation/view/screens/log_in_screen.dart';
import 'package:fit_volt/feature/auth/sign_up/presentation/view/screens/sign_up_screen.dart';
import 'package:fit_volt/feature/profile_setup/presentation/view/screens/profile_setup_screen.dart';
import 'package:fit_volt/feature/welcome_screen/wlcome.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String logInScreen = "LogInScreen";
  static String signUpScreen = "SignUpScreen";
  static String welcome = "Welcome";
  static String profileSetup = "ProfileSetupScreen";
  static Map<String, WidgetBuilder> appRoutes = {
    "LogInScreen": (context) => LogInScreen(),
    "SignUpScreen": (context) => SignUpScreen(),
    "ProfileSetupScreen": (context) => ProfileSetupScreen(),
    "Welcome": (context) => Welcome(),
  };
}
