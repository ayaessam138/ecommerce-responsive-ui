import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';

class OrderSummaryItemWidget extends StatelessWidget {
  const OrderSummaryItemWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.subTitleStyle,
    this.titleStyle,
  });
  final String title;
  final String subTitle;
  final TextStyle? subTitleStyle;
  final TextStyle? titleStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: AutoSizeText(
            title,
            style: titleStyle ?? TextStyles.font14Regular,
            maxLines: 1,
          ),
        ),
        Flexible(
          child: AutoSizeText(
            subTitle,
            style: subTitleStyle ?? TextStyles.font14Regular,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}