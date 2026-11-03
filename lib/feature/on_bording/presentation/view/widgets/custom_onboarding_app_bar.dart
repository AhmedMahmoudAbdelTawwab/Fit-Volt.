import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:fit_volt/core/common/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomOnboardingAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomOnboardingAppBar({
    super.key,
    required this.onSkip,
    this.onBack,
    this.title,
    this.showBackButton = true,
  });

  final VoidCallback onSkip;
  final VoidCallback? onBack;
  final Widget? title;
  final bool showBackButton;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              SizedBox(
                width: 80,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: showBackButton
                      ? InkWell(
                          enableFeedback: false,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          highlightColor: Colors.transparent,
                          onTap: onBack ?? () => Navigator.pop(context),
                          customBorder: const CircleBorder(),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.backButtonBackgroundColor,
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              size: 20,
                              color: AppColors.primaryTextColor,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ),
              ),
              Expanded(child: Center(child: title)),
              SizedBox(
                width: 80,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    enableFeedback: false,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    highlightColor: Colors.transparent,
                    onTap: onSkip,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      child: CustomTextWidget(
                        data: "Skip",
                        fontSize: 18,
                        color: AppColors.secoundryTextColor,
                        fontWeight: .w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
