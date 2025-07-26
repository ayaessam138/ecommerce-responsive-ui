import 'package:client/core/helpers/app_spacing.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';


import '../../../emptysecreens/widgets/empty_screen_button.dart';
import '../widgets/profile/edit_profile_textfileds_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Column(
          children: [
            /// Top Bar
            AppbarWidget(title: AppStrings.editProfile(context: context)),
            AppSpace.vertical(AppHeight.h12),

            /// Content Section
            EditProfileTextFieldsWidget(),

            /// Bottom Button
            Column(
              spacing: AppHeight.h10,
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(thickness: 0.2.w, color: ColorsManager.black),
                Padding(
                  padding: EdgeInsets.all(AppPadding.p16),
                  child: AppButton(
                    title: AppStrings.saveNow(context: context),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     resizeToAvoidBottomInset: false,
//     backgroundColor: ColorsManager.white,
//     body: SafeArea(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: AppWidth.w20,
//               vertical: AppHeight.h10,
//             ),
//             child: Row(
//               spacing: AppWidth.w12,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: SvgPicture.asset(AppImages.arrowIcon),
//                 ),
//                 Text(
//                   AppStrings.editProfile(context: context),
//                   style: TextStyles.font18Bold,
//                 ),
//               ],
//             ),
//           ),
//           Divider(thickness: 0.2.w, color: ColorsManager.black),
//
//           // Profile body
//           Padding(
//             padding: EdgeInsets.all(AppPadding.p16),
//             child: Container(
//               padding: EdgeInsets.all(AppPadding.p16),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(AppRadius.r8),
//                 border: Border.all(color: ColorsManager.lightGreyColor),
//               ),
//               child: Column(
//                 spacing: AppHeight.h12,
//                 children: [
//                   Row(
//                     spacing: AppWidth.w12,
//                     children: [
//                       InkWell(
//                         onTap: () {},
//                         child: Image.asset(
//                           AppImages.profileImage,
//                           height: AppHeight.fullHeight(context) * .08,
//                         ),
//                       ),
//                       Column(
//                         spacing: AppHeight.h10,
//                         children: [
//                           Text(
//                             "Eddie Mitchell",
//                             style: TextStyles.font16Semi,
//                           ),
//                           AppButton(
//                             title: AppStrings.uploadImage(context: context),
//                             onTap: () {},
//                             width: AppWidth.fullWidth(context) * .3,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//
//                   Divider(thickness: 0.2.w, color: ColorsManager.black),
//                   AppTextField(
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(
//                         left: AppPadding.p12,
//                         right: AppPadding.p8,
//                         bottom: AppPadding.p12,
//                         top: AppPadding.p12,
//                       ),
//                       child: SvgPicture.asset(AppImages.userIcon),
//                     ),
//                     validator: (val) {},
//                     hintText: AppStrings.fullName(context: context),
//                   ),
//                   AppTextField(
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(
//                         left: AppPadding.p12,
//                         right: AppPadding.p8,
//                         bottom: AppPadding.p12,
//                         top: AppPadding.p12,
//                       ),
//                       child: SvgPicture.asset(AppImages.dateOfBirthIcon),
//                     ),
//                     validator: (val) {},
//                     hintText: AppStrings.dateOfBirth(context: context),
//                   ),
//                   AppTextField(
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(
//                         left: AppPadding.p12,
//                         right: AppPadding.p8,
//                         bottom: AppPadding.p12,
//                         top: AppPadding.p12,
//                       ),
//                       child: SvgPicture.asset(AppImages.phoneIcon),
//                     ),
//                     validator: (val) {},
//                     hintText: AppStrings.phone(context: context),
//                   ),
//                   AppTextField(
//                     prefixIcon: Padding(
//                       padding: EdgeInsets.only(
//                         left: AppPadding.p12,
//                         right: AppPadding.p8,
//                         bottom: AppPadding.p12,
//                         top: AppPadding.p12,
//                       ),
//                       child: SvgPicture.asset(AppImages.emailIcon),
//                     ),
//                     validator: (val) {},
//                     hintText: AppStrings.email(context: context),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Spacer(),
//           Divider(thickness: 0.2.w, color: ColorsManager.black),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: AppWidth.w16,),
//             child: AppButton(
//               title: AppStrings.signUp(context: context),
//               onTap: () {
//                 // AppNavigator.pushNamed(context, AppRoutes.successOrderPaymentRoute);
//               },
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
