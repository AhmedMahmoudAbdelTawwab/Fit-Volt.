import 'package:fit_volt/feature/auth/log_in/presentation/view/screens/log_in_screen.dart';
import 'package:fit_volt/feature/auth/sign_up/presentation/view/screens/sign_up_screen.dart';
import 'package:fit_volt/feature/on_bording/presentation/view/screens/first_screen.dart';
import 'package:fit_volt/feature/on_bording/presentation/view/screens/secound_screen.dart';
import 'package:fit_volt/feature/on_bording/presentation/view/screens/third_screen.dart';
import 'package:fit_volt/feature/welcome_screen/wlcome.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String firstScreenRoute = "FirstScreen";
  static String secoundScreenRoute = "SecoundScreen";
  static String thirdScreen = "ThirdScreen";
  static String logInScreen = "LogInScreen";
  static String signUpScreen = "SignUpScreen";
  static String welcome = "Welcome";
  static Map<String, WidgetBuilder> appRoutes = {
    "FirstScreen": (context) => FirstScreen(),
    "SecoundScreen": (context) => SecondScreen(),
    "ThirdScreen": (context) => ThirdScreen(),
    "LogInScreen": (context) => LogInScreen(),
    "SignUpScreen": (context) => SignUpScreen(),
    "Welcome": (context) => Welcome(),
  };
}
