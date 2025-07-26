import 'package:client/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';

import '../../../emptysecreens/widgets/empty_screen_button.dart';
import '../widgets/adress/addaddress_textfields_widget.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarWidget(title: AppStrings.addSippingAddress(context: context),),

            //Profile body
            AddAddressTextFieldsWidget(),
            Divider(
              thickness: 0.2.w,
              color: ColorsManager.black,
              height: AppHeight.h1,
            ),

            Padding(
              padding: EdgeInsets.all(AppPadding.p16),
              child: AppButton(
                title: AppStrings.saveNow(context: context),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
