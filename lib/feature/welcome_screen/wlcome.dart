import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome", style: TextStyle(color: AppColors.primaryColor)),
      ),
    );
  }
}
