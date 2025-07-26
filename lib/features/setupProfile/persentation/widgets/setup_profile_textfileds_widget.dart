import 'package:client/features/setupProfile/persentation/controller/set_up_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/datepicker_textfield.dart';

class SetupProfileTextFieldsWidget extends StatefulWidget {
  const SetupProfileTextFieldsWidget({super.key});

  @override
  State<SetupProfileTextFieldsWidget> createState() =>
      _SetupProfileTextFieldsWidgetState();
}

class _SetupProfileTextFieldsWidgetState
    extends State<SetupProfileTextFieldsWidget> {
  final TextEditingController dateOfBirthController = TextEditingController();

  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p16),
      child: BlocBuilder<SetUpProfileCubit, SetUpProfileState>(
        builder: (context, state) {
          var cubit = SetUpProfileCubit.of(context);
          return Column(
            spacing: AppHeight.h16,
            children: [
              InkWell(
                onTap: () {
                  cubit.pickProfileImage();
                },
                child:
                    cubit.profileImage == null
                        ? Image.asset(AppImages.profileImage)
                        : CircleAvatar(
                          radius: 50.r,
                          backgroundImage: FileImage(cubit.profileImage!),
                        ),
              ),
              Text(
                AppStrings.uploadImage(context: context),
                style: TextStyles.font16Regular.copyWith(
                  color: ColorsManager.mainColor,
                ),
              ),
              AppTextField(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    left: AppPadding.p12,
                    right: AppPadding.p8,
                    bottom: AppPadding.p12,
                    top: AppPadding.p12,
                  ),
                  child: SvgPicture.asset(AppImages.userIcon),
                ),
                validator: (val) {},
                hintText: AppStrings.firstName(context: context),
              ),
              AppTextField(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    left: AppPadding.p12,
                    right: AppPadding.p8,
                    bottom: AppPadding.p12,
                    top: AppPadding.p12,
                  ),
                  child: SvgPicture.asset(AppImages.userIcon),
                ),
                validator: (val) {},
                hintText: AppStrings.lastName(context: context),
              ),
              DatePickerTextField(
                controller: dateOfBirthController,

                onDateSelected: (date) {
                  setState(() {
                    _selectedDate = date;
                    dateOfBirthController.text = DateFormat(
                      'yyyy-MM-dd',
                    ).format(date);
                  });
                },
              ),

              // GestureDetector(
              //   onTap: () {},
              //   child: AppTextField(
              //     controller: TextEditingController(),
              //     enabled: false,
              //     prefixIcon: Padding(
              //       padding: EdgeInsets.only(
              //         left: AppPadding.p12,
              //         right: AppPadding.p8,
              //         bottom: AppPadding.p12,
              //         top: AppPadding.p12,
              //       ),
              //       child: SvgPicture.asset(AppImages.dateOfBirthIcon),
              //     ),
              //     validator: (val) {},
              //     hintText: AppStrings.dateOfBirth(context: context),
              //   ),
              // ),
              AppTextField(
                enabled: false,
                controller: TextEditingController(text: cubit.number),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    left: AppPadding.p12,
                    right: AppPadding.p8,
                    bottom: AppPadding.p12,
                    top: AppPadding.p12,
                  ),
                  child: SvgPicture.asset(AppImages.phoneIcon),
                ),
                validator: (val) {},
                hintText: AppStrings.phone(context: context),
              ),
              AppTextField(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    left: AppPadding.p12,
                    right: AppPadding.p8,
                    bottom: AppPadding.p12,
                    top: AppPadding.p12,
                  ),
                  child: SvgPicture.asset(AppImages.emailIcon),
                ),
                validator: (val) {},
                hintText: AppStrings.email(context: context),
              ),
            ],
          );
        },
      ),
    );
  }
}
