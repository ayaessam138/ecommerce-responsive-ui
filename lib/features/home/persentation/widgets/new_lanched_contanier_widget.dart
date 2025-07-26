import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/features/emptysecreens/widgets/empty_screen_button.dart';
import 'package:client/features/home/persentation/widgets/sales_contanier_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class NewLanchedContanierWidget extends StatelessWidget {
  const NewLanchedContanierWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppWidth.fullWidth(context),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          SalesContainerWidget(),
          Padding(
            padding: EdgeInsets.all(AppPadding.p30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "NEW\nARRIVAL",
                  style: TextStyles.font20Bold.copyWith(
                    color: ColorsManager.white,
                  ),
                ),
                AutoSizeText(
                  "SPECIAL OFFER ",
                  style: TextStyles.font18Medium.copyWith(
                    color: ColorsManager.white,
                  ),
                ),
                AppButton(
                  title: "50% off",
                  onTap: () {},
                  buttoncolor: ColorsManager.redColor,
                  width: AppWidth.fullWidth(context) * .25,
                  verticalPadding: 2.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
