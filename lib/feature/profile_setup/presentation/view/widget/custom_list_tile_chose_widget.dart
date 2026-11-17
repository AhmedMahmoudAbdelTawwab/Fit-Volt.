import 'package:fit_volt/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomListTileChoseWidget extends StatelessWidget {
  CustomListTileChoseWidget({
    super.key,
    required this.title,
    required this.imageIcon,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final String imageIcon;
  final bool value;
  final void Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.listTileBackGround,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: value ? AppColors.primaryColor : Colors.grey.shade800,
            width: value ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: value ? AppColors.primaryColor : Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                imageIcon,
                color: value ? AppColors.primaryColor : Colors.grey,
              ),
            ),
            const SizedBox(width: 16),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: value ? AppColors.primaryColor : Colors.transparent,
                border: Border.all(
                  color: value ? AppColors.primaryColor : Colors.grey.shade700,
                  width: 1.5,
                ),
              ),
              child: value
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
