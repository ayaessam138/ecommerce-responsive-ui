import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/helpers/app_strings.dart';
import '../../../../../core/helpers/app_values.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_dropdown_widget.dart';
import '../../../../../core/widgets/app_text_field.dart';
import 'address_type_widget.dart';

class AddAddressTextFieldsWidget extends StatefulWidget {
  const AddAddressTextFieldsWidget({super.key});

  @override
  State<AddAddressTextFieldsWidget> createState() =>
      _AddAddressTextFieldsWidgetState();
}

class _AddAddressTextFieldsWidgetState
    extends State<AddAddressTextFieldsWidget> {
  String? selectedCity;
  String? selectedArea;
  String? selectedCode;
  String? selectedAddressType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p16),
          child: Container(
            padding: EdgeInsets.all(AppPadding.p16),
            decoration: BoxDecoration(
              border: Border.all(color: ColorsManager.greyColor),
              borderRadius: BorderRadius.circular(AppRadius.r12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppHeight.h16,
              children: [
                AppDropdownField<String>(
                  contentPadding: EdgeInsets.all(AppPadding.p20),
                  items: [
                    DropdownMenuItem(value: 'Cairo', child: Text('Cairo')),
                    DropdownMenuItem(
                      value: 'Mansoura',
                      child: Text('Mansoura'),
                    ),
                  ],
                  value: selectedCity,
                  onChanged: (val) {
                    setState(() {
                      selectedCity = val;
                    });
                  },
                  hintText: AppStrings.city(context: context),
                  validator: (val) => val == null ? 'اختار المدينة' : null,
                ),
                AppDropdownField<String>(
                  contentPadding: EdgeInsets.all(AppPadding.p20),
                  items: [
                    DropdownMenuItem(value: 'Maddii', child: Text('Maddii')),
                    DropdownMenuItem(
                      value: 'Heloplies',
                      child: Text('Heloplies'),
                    ),
                  ],
                  value: selectedArea,
                  onChanged: (val) {
                    setState(() {
                      selectedArea = val;
                    });
                  },
                  hintText: AppStrings.area(context: context),
                  validator: (val) => val == null ? 'اختار المنطقة' : null,
                ),
                // AppDropdownField<String>(
                //   items: [
                //     DropdownMenuItem(value: '122', child: Text('122')),
                //     DropdownMenuItem(value: '133', child: Text('133')),
                //   ],
                //   value: selectedCode,
                //   onChanged: (val) {
                //     setState(() {
                //       selectedCode = val;
                //     });
                //   },
                //   hintText: AppStrings.zipCode(context: context),
                //   validator: (val) => val == null ? 'اختار الكود' : null,
                // ),
                AppTextField(
                  contentPadding: EdgeInsets.all(AppPadding.p20),
                  validator:
                      (val) =>
                          val == null || val.isEmpty ? 'اختار الكود' : null,
                  hintText: AppStrings.zipCode(context: context),
                ),
                AppTextField(
                  contentPadding: EdgeInsets.all(AppPadding.p20),
                  validator:
                      (val) =>
                          val == null || val.isEmpty ? 'اكتب العنوان' : null,
                  hintText: AppStrings.address(context: context),
                ),
                AutoSizeText(
                  AppStrings.chooseAddressType(context: context),
                  style: TextStyles.font16Semi,
                ),
                Row(
                  spacing: AppWidth.w10,
                  children: [
                    AddressTypeWidget(
                      imagePath: AppImages.homeIcon,
                      addressType: AppStrings.home(context: context),
                      isSelected:
                          selectedAddressType ==
                          AppStrings.home(context: context),
                      onTap: () {
                        setState(() {
                          selectedAddressType = AppStrings.home(
                            context: context,
                          );
                        });
                      },
                    ),
                    AddressTypeWidget(
                      imagePath: AppImages.officeAddressIcon,
                      addressType: AppStrings.office(context: context),
                      isSelected:
                          selectedAddressType ==
                          AppStrings.office(context: context),
                      onTap: () {
                        setState(() {
                          selectedAddressType = AppStrings.office(
                            context: context,
                          );
                        });
                      },
                    ),
                    // AddressTypeWidget(
                    //   imagePath: AppImages.cityIcon,
                    //   addressType: AppStrings.city(context: context),
                    //   isSelected:
                    //       selectedAddressType ==
                    //       AppStrings.city(context: context),
                    //   onTap: () {
                    //     setState(() {
                    //       selectedAddressType = AppStrings.city(
                    //         context: context,
                    //       );
                    //     });
                    //   },
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
