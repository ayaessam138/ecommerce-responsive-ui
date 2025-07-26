import 'package:client/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/helpers/app_strings.dart';
import '../../../../../core/helpers/app_values.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../controller/profile_cubit.dart';

class EditProfileTextFieldsWidget extends StatelessWidget {
  EditProfileTextFieldsWidget({super.key});

  final TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppWidth.w16,
            vertical: AppHeight.h10,
          ), // prevent hiding
          child: Container(
            padding: EdgeInsets.all(AppPadding.p16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r8),
              border: Border.all(color: ColorsManager.lightGreyColor),
            ),
            child: Column(
              spacing: AppHeight.h12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Profile Row
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: AppWidth.w12,
                  children: [
                    Image.asset(
                      AppImages.profileImage,
                      height: AppHeight.fullHeight(context) * .08,
                    ),

                    Text("Eddie Mitchell", style: TextStyles.font16Semi),
                  ],
                ),

                Divider(thickness: 0.2.w, color: ColorsManager.black),

                /// Form Fields
                AppTextField(
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p8,
                      vertical: AppPadding.p12,
                    ),
                    child: SvgPicture.asset(AppImages.userIcon),
                  ),
                  validator: (val) {},
                  hintText: AppStrings.fullName(context: context),
                ),
                AppTextField(

                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p8,
                      vertical: AppPadding.p12,
                    ),
                    child: SvgPicture.asset(AppImages.dateOfBirthIcon),
                  ),
                  validator: (val) {},
                  hintText: AppStrings.dateOfBirth(context: context),
                ),
                BlocBuilder<ProfileCubit,ProfileState>(
                  builder: (context, state) {
                    var cubit=ProfileCubit.of(context);
                    return AppTextField(
                      controller: TextEditingController(text:cubit.phoneNumber),
                      readOnly: true,
                      suffixIcon: InkWell(
                        onTap: () {
                          AppNavigator.goNamed(context, AppRoutes.loginRoute);
                        },
                        child: Icon(Icons.edit),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p8,
                          vertical: AppPadding.p12,
                        ),
                        child: SvgPicture.asset(AppImages.phoneIcon),
                      ),
                      validator: (val) {},
                      hintText: AppStrings.phone(context: context),
                    );
                  },
                ),
                AppTextField(
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p8,
                      vertical: AppPadding.p12,
                    ),
                    child: SvgPicture.asset(AppImages.emailIcon),
                  ),
                  validator: (val) {},
                  hintText: AppStrings.email(context: context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
