
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropdownField<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final String? hintText;
  final String? labelText;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isDense;
  final Color? fillColor;
  final BorderRadius? borderRadius;
  final Color? focusedBorderColor;
  final Color? unFocusedBorderColor;
  final EdgeInsetsGeometry? contentPadding;
  final AutovalidateMode? autovalidateMode;
  final bool isNoBorder;
  final bool isNoErrorBorder;
  final Color? dropdownColor;

  const AppDropdownField({
    super.key,
    required this.items,
    this.value,
    this.dropdownColor,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.validator,
    this.textStyle,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.isDense,
    this.fillColor,
    this.borderRadius,
    this.focusedBorderColor,
    this.unFocusedBorderColor,
    this.contentPadding,
    this.autovalidateMode,
    this.isNoBorder = false,
    this.isNoErrorBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      dropdownColor: dropdownColor??ColorsManager.white,
      autovalidateMode: autovalidateMode,
      value: value,
      onChanged: onChanged,
      validator: validator,
      items: items,
      style: textStyle ?? TextStyle(fontSize: 14.sp, color: ColorsManager.black),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyles.font12Regular.copyWith(
          color: ColorsManager.black,
        ),
        filled: true,
        fillColor: fillColor ?? Colors.transparent,
        isDense: isDense,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font12Light.copyWith(color: ColorsManager.black),
        contentPadding: contentPadding ?? EdgeInsets.all(14.w),
        errorBorder: isNoErrorBorder ? InputBorder.none : null,
        focusedErrorBorder: isNoErrorBorder ? InputBorder.none : null,
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(AppRadius.rDefault),
          borderSide: BorderSide(
            color: isNoBorder
                ? Colors.transparent
                : unFocusedBorderColor ?? ColorsManager.lightGreyColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(AppRadius.rDefault),
          borderSide: BorderSide(
            color: isNoBorder
                ? Colors.transparent
                : unFocusedBorderColor ?? ColorsManager.lightGreyColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(AppRadius.rDefault),
          borderSide: BorderSide(
            color: isNoBorder
                ? Colors.transparent
                : focusedBorderColor ?? ColorsManager.lightGreyColor,
          ),
        ),
      ),
    );
  }
}
