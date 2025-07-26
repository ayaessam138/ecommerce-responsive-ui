import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class SearchListviewItemWidget extends StatelessWidget {
  const SearchListviewItemWidget({
    super.key,
    required this.onTapRemove,
    required this.title,
  });

  final void Function() onTapRemove;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(title, style: TextStyles.font16Medium),
        InkWell(
          onTap: onTapRemove,
          child: Icon(Icons.close, color: ColorsManager.greyColor),
        ),
      ],
    );
  }
}