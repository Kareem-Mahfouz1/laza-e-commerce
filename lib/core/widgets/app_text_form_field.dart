import 'package:flutter/material.dart';
import 'package:laza/core/theming/color_manager.dart';
import 'package:laza/core/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.controller,
    required this.validator,
    required this.labelText,
    this.isObsecureText,
    this.sufficIcon,
    this.isFinalField,
  });
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final String labelText;
  final Widget? sufficIcon;
  final bool? isObsecureText;
  final bool? isFinalField;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Styles.font13GreyRegular,
        suffixIcon: sufficIcon,
        errorMaxLines: 2,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey),
        ),
      ),
      cursorColor: ColorManager.primary,
      style: Styles.font15BlackMedium.copyWith(fontWeight: FontWeight.w600),
      keyboardType: TextInputType.text,
      textInputAction:
          isFinalField ?? false ? TextInputAction.done : TextInputAction.next,
      validator: validator,
      obscureText: isObsecureText ?? false,
      controller: controller,
    );
  }
}
