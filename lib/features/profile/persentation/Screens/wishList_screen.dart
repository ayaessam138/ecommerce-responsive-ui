
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:client/core/widgets/app_text_field.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:client/features/profile/persentation/widgets/wishlist/wishlist_gridview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarWidget(title: AppStrings.wishList(context: context)),
            Padding(
              padding: EdgeInsets.all(AppPadding.p16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      AppNavigator.pushNamed(context, AppRoutes.searchRoute);
                    },
                    child: AppTextField(
                      enabled: false,
                      validator: (val) {},
                      hintText: AppStrings.findSomeThing(context: context),
                      hintStyle: TextStyles.font16Regular.copyWith(
                        color: ColorsManager.greyColor,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: ColorsManager.black,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: WishlistGridviewWidget()),
          ],
        ),
      ),
    );
  }
}
