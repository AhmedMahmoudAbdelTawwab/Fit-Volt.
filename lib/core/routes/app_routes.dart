import 'package:fit_volt/feature/on_bording/presentation/view/screens/first_screen.dart';
import 'package:fit_volt/feature/on_bording/presentation/view/screens/secound_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String firstScreenRoute = "FirstScreen";
  static String secoundScreenRoute = "SecoundScreen";

  static Map<String, WidgetBuilder> appRoutes = {
    "FirstScreen": (context) => FirstScreen(),
    "SecoundScreen": (context) => SecondScreen(),
  };
}
