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
    this.fillColor,
    this.isFilled,
    this.hintText,
    this.floatingLabel = true,
  });
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final String labelText;
  final String? hintText;
  final Widget? sufficIcon;
  final bool? isObsecureText;
  final bool? isFinalField;
  final bool floatingLabel;
  final bool? isFilled;
  final Color? fillColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        floatingLabelBehavior:
            floatingLabel
                ? FloatingLabelBehavior.always
                : FloatingLabelBehavior.never,
        hintText: hintText,
        hintStyle: Styles.font13GreyRegular,
        filled: isFilled ?? false,
        fillColor: fillColor,
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        labelText: labelText,
        labelStyle: Styles.font13GreyRegular,
        suffixIcon: sufficIcon,
        errorMaxLines: 2,
        focusedBorder:
            focusedBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManager.grey),
            ),
        enabledBorder:
            enabledBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManager.grey),
            ),
        border:
            enabledBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManager.grey),
            ),
      ),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
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
