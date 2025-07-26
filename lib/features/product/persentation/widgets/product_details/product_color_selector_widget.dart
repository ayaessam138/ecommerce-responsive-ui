import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:flutter/material.dart';

class ProductColorSelector extends StatefulWidget {
  const ProductColorSelector({super.key});

  @override
  State<ProductColorSelector> createState() => _ProductColorSelectorState();
}

class _ProductColorSelectorState extends State<ProductColorSelector> {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(colors.length, (index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin:  EdgeInsets.symmetric(horizontal:AppWidth.w8),
              width: AppWidth.w35,
              height: AppHeight.h35,
              decoration: BoxDecoration(
                color: colors[index],
                shape: BoxShape.circle,
              ),
              child:
                  isSelected
                      ? const Icon(Icons.check, color: ColorsManager.white)
                      : null,
            ),
          );
        }),
      ),
    );
  }
}
