import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';

class ProductSizeSelectorWidget extends StatefulWidget {
  const ProductSizeSelectorWidget({super.key});

  @override
  State<ProductSizeSelectorWidget> createState() =>
      _ProductSizeSelectorWidgetState();
}

class _ProductSizeSelectorWidgetState extends State<ProductSizeSelectorWidget> {
  final List<String> sizesList = ["XS", "S", "M", "L", "XL", "XXL"];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(sizesList.length, (index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding:  EdgeInsets.all(AppPadding.p8),
              child: Container(
                // padding: EdgeInsets.all(AppPadding.p12),
                width: AppWidth.w35,
                height: AppHeight.h35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        isSelected
                            ? ColorsManager.mainColor
                            : ColorsManager.greyColor,
                  ),
                ),
                child: Center(
                  child: AutoSizeText(
                    sizesList[index],
                    maxLines: 1,
                    style: TextStyles.font14Regular.copyWith(
                      color: isSelected ? ColorsManager.mainColor : null,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
