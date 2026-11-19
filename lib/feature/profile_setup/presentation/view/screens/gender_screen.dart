import 'package:fit_volt/core/common/custom_text_widget.dart';
import 'package:fit_volt/core/utils/app_icons.dart';
import 'package:fit_volt/feature/profile_setup/presentation/view/widget/custom_list_tile_chose_widget.dart';
import 'package:flutter/material.dart';

class GenderScreen extends StatefulWidget {
  GenderScreen({super.key, required this._controller});
  final PageController _controller;
  @override
  State<GenderScreen> createState() =>
      _GenderScreenState(controller: _controller);
}

class _GenderScreenState extends State<GenderScreen> {
  _GenderScreenState({required this.controller});
  PageController controller;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextWidget(
          data: "What is your gender?",
          fontSize: 32,
          fontWeight: .w700,
        ),

        CustomListTileChoseWidget(
          title: "Male",
          imageIcon: AppIcons.maleIcon,
          value: isSelected,
          onChanged: (isSelected) {
            if (isSelected == true) {
              controller.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.bounceIn,
              );
            }
          },
        ),
        CustomListTileChoseWidget(
          title: "Female",
          imageIcon: AppIcons.femaleIcon,
          value: isSelected,
          onChanged: (isSelected) {
            if (isSelected == true) {
              controller.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.bounceIn,
              );
            }
          },
        ),
      ],
    );
  }
}
