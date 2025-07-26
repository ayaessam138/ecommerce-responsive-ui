import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/theming/colors.dart';

import 'package:flutter/material.dart';

import '../theming/styles.dart';

class CheckboxItem extends StatelessWidget {
  final void Function(bool?) onChanged;
  final String title;
  final bool value;

  const CheckboxItem({
    super.key,
    required this.onChanged,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: ColorsManager.mainColor,
      checkColor: ColorsManager.white,

      value: value,
      onChanged: onChanged,
      title: AutoSizeText(title, style: TextStyles.font16Semi),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
