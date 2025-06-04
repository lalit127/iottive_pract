import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iottive_pract/config/app_colors.dart';
import 'package:iottive_pract/config/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final Color? fillColor;
  final bool? isEnabled;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool isPasswordField;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final Color? borderColor;
  final int? maxLines;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final bool? isFilled;
  final InputBorder? border;

  const AppTextField({
    super.key,
    this.hintText,
    this.hintStyle,
    this.controller,
    this.obscureText = false,
    this.isEnabled = true,
    this.isFilled = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.fillColor,
    this.prefixWidget,
    this.suffixWidget,
    this.isPasswordField = false,
    this.inputFormatters,
    this.borderColor,
    this.maxLength,
    this.maxLines = 1,
    this.validator,
    this.border,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool isObscured;

  @override
  void initState() {
    super.initState();
    isObscured = widget.obscureText;
  }

  void toggleObscure() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnabled,
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: isObscured,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      style: AppTextStyles(
        context,
      ).display18W500.copyWith(color: AppColors.black),
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: widget.isFilled,
        fillColor: widget.fillColor ?? Colors.transparent,
        hintStyle:
            widget.hintStyle ??
            AppTextStyles(
              context,
            ).display14W400.copyWith(color: AppColors.grayDark),
        border:
            widget.border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        enabledBorder:
            widget.border ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.grayLight,
                width: 1.0,
              ),
            ),
        disabledBorder:
            widget.border ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.grayLight,
                width: 1.0,
              ),
            ),
        focusedBorder:
            widget.border ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.primaryColor,
                width: 1.0,
              ),
            ),
        errorBorder:
            widget.border ??
            const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
        prefixIcon:
            widget.prefixWidget != null
                ? Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: widget.prefixWidget!,
                )
                : null,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIcon:
            widget.isPasswordField
                ? IconButton(
                  icon: Icon(
                    isObscured
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: toggleObscure,
                )
                : widget.suffixWidget != null
                ? Padding(
                  padding: const EdgeInsets.only(left: 8, right: 12),
                  child: widget.suffixWidget!,
                )
                : null,
        counterText: '',
      ),
    );
  }
}
