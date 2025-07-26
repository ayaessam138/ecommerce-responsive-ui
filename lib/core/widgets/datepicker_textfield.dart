
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../helpers/app_images.dart';
import '../helpers/app_values.dart';

class DatePickerTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final void Function(DateTime selectedDate)? onDateSelected;

  const DatePickerTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.onDateSelected,
  });

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2070),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary:
                  ColorsManager
                      .mainColor, // اللون الأساسي (الدايرة حوالين التاريخ)
              onPrimary: ColorsManager.white, // لون النص داخل الدايرة
              surface: ColorsManager.white, // خلفية الـ DatePicker
              onSurface: ColorsManager.black, // لون النص العادي
            ),

            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorsManager.mainColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      controller.text = formattedDate;
      if (onDateSelected != null) {
        onDateSelected!(pickedDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: AppTextField(
          hintText: AppStrings.dateOfBirth(context: context),
          controller: controller,
          enabled: false,
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: AppPadding.p12,
              right: AppPadding.p8,
              bottom: AppPadding.p12,
              top: AppPadding.p12,
            ),
            child: SvgPicture.asset(AppImages.dateOfBirthIcon),
          ),
          validator: (String? val) {},
        ),
      ),
    );
  }
}
