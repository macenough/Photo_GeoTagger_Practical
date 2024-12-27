import 'package:flutter/material.dart';

import '../../app/config/app_colors.dart';
import '../../app/config/app_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll<Color>(AppColors.black),
        shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
      onPressed: onPressed,
      child: Text(
        AppConstants.btnCapture,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: AppColors.textBlackColor, fontSize: 12),
      ),
    );
  }
}
