import 'package:client/core/helpers/app_spacing.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/appbar_widget.dart';
import '../widgets/all_products/all_products_gridview_widget.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarWidget(title: AppStrings.products(context: context)),
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
            Expanded(child: AllProductGridviewWidget()),
            AppSpace.vertical(AppHeight.h16)
          ],
        ),
      ),
    );
  }
}
