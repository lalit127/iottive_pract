import 'package:flutter/material.dart';
import 'package:iottive_pract/config/app_colors.dart';
import 'package:iottive_pract/config/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? buttonColor;
  final Color? borderColor;
  final bool isLoading;
  final double? width;
  final bool? isEnabled;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.buttonColor,
    this.borderColor,
    this.width,
    this.isEnabled,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: width ?? size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
        ),
        onPressed: isLoading ? null : onPressed,
        child: Text(
          text,
          style: AppTextStyles(
            context,
          ).display18W500.copyWith(color: textColor ?? AppColors.whiteOff),
        ),
      ),
    );
  }
}
