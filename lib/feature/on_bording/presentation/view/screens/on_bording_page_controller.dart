import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:fit_volt/feature/on_bording/presentation/view/screens/first_screen.dart';
import 'package:fit_volt/feature/on_bording/presentation/view/screens/secound_screen.dart';
import 'package:fit_volt/feature/on_bording/presentation/view/screens/third_screen.dart';
import 'package:fit_volt/feature/on_bording/presentation/view/widgets/custom_navigate_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingPageController extends StatefulWidget {
  const new({super.key});

  @override
  State<OnBordingPageController> createState() =>
      _OnBordingPageControllerState();
}

class _OnBordingPageControllerState extends State<OnBordingPageController> {
  PageController _controller = PageController();
  List<Widget> pages = [FirstScreen(), SecoundScreen(), ThirdScreen()];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView(
                  controller: _controller,
                  children: pages,
                  onPageChanged: (indexPageView) {
                    index = indexPageView;
                    print(index);
                  },
                ),
              ),
              Expanded(
                child: Column(
                  spacing: 12,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: pages.length,

                      effect: ExpandingDotsEffect(
                        activeDotColor: AppColors.primaryColor,
                        dotColor: AppColors.hintTextColor,
                        dotHeight: 8,
                        dotWidth: 8,
                      ),
                    ),
                    CustomNavigateButton(
                      onPressed: () {
                        print(index);
                        if (index < pages.length) {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.bounceIn,
                          );
                        } else {}
                      },
                      data: "Next",
                    ),
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
