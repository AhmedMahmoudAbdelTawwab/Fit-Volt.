import 'package:fit_volt/feature/profile_setup/presentation/view/screens/gender_screen.dart';
import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  PageController _controller = PageController();
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PageView(children: [GenderScreen(controller: _controller)]),
        ],
      ),
    );
  }
}
