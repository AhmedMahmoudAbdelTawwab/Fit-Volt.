import 'package:fit_volt/core/common/custom_text_widget.dart';
import 'package:fit_volt/core/utils/app_icons.dart';
import 'package:fit_volt/feature/profile_setup/presentation/view/widget/custom_list_tile_chose_widget.dart';
import 'package:flutter/material.dart';

class GenderScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
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
          onChanged: (isSelected) {},
        ),
        CustomListTileChoseWidget(
          title: "Female",
          imageIcon: AppIcons.femaleIcon,
          value: isSelected,
          onChanged: (isSelected) {},
        ),
      ],
    );
  }
}
