import 'package:flutter/material.dart';

import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';

class CustomTextForm extends StatelessWidget {
  final String? hinttext;
  final TextEditingController controller;
  final bool? obscureText;
  final bool? readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final Function()? onTap;
  final String? Function(String?)? validator;
  const CustomTextForm(
      {super.key,
      this.hinttext,
      required this.controller,
      this.obscureText,
      this.keyboardType,
      this.validator,
      this.readOnly,
      this.onTap,
      this.prefixIcon,
      this.suffixIcon,
      this.labelText,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap ?? () {},
      readOnly: readOnly ?? false,
      focusNode: focusNode,
      cursorColor: AppColors.primaryColor,
      style: AppTextStyles.font18BlackBold,
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
          floatingLabelStyle:
              AppTextStyles.font16graySemiBold.copyWith(fontSize: 22),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          labelText: labelText,
          labelStyle: AppTextStyles.font18graySemiBold,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: AppColors.red)),
          errorStyle: AppTextStyles.font12RedW600,
          hintText: hinttext ?? "",
          hintStyle: AppTextStyles.font15BlackW600,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.black)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
