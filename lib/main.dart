import 'package:firebase_core/firebase_core.dart';
import 'package:fit_volt/core/routes/app_routes.dart';
import 'package:fit_volt/core/service_locator/service_locator.dart';
import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:fit_volt/feature/on_bording/presentation/view/screens/on_bording_page_controller.dart';
import 'package:fit_volt/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  runApp(FitVolt());
}

class FitVolt extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),

      routes: AppRoutes.appRoutes,
      home: OnBordingPageController(),
    );
  }
}
