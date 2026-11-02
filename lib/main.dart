import 'package:fit_volt/core/routes/app_routes.dart';
import 'package:fit_volt/feature/on_bording/presentation/view/screens/first_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FitVolt());
}

class FitVolt extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: AppRoutes.appRoutes, home: FirstScreen());
  }
}
