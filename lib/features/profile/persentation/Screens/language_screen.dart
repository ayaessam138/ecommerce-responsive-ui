import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_secure_local_storage.dart';
import 'package:client/core/helpers/app_spacing.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../emptysecreens/widgets/empty_screen_button.dart' show AppButton;

class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key});
  String? langCode;
  @override
  Widget build(BuildContext context) {
    List<LanguageModel> lang = [
      LanguageModel(
        image: AppImages.englishIcon,
        name: AppStrings.english(context: context),
        langCode: 'en',
      ),
      LanguageModel(
        image: AppImages.arabicIcon,
        name: AppStrings.arabic(context: context),
        langCode: 'ar',
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarWidget(title: AppStrings.language(context: context)),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(AppPadding.p16),
                shrinkWrap: true,
                itemCount: lang.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      AppSecureLocalStorageHelperFunctions.saveLanguage(
                        language: lang[index].langCode,
                      );
                      langCode =
                          await AppSecureLocalStorageHelperFunctions.getLanguage();
                    },
                    child: Container(
                      padding: EdgeInsets.all(AppPadding.p12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.r8),
                        border: Border.all(color: ColorsManager.lightGreyColor),
                      ),
                      child: Row(
                        spacing: AppWidth.w12,
                        children: [
                          SvgPicture.asset(
                            lang[index].image,
                            height: AppHeight.fullHeight(context) * .05,
                            width: AppWidth.fullWidth(context) * .2,
                          ),
                          Flexible(child: AutoSizeText(lang[index].name,style: TextStyles.font16Semi,)),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return AppSpace.vertical(AppHeight.h16);
                },
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppWidth.w16,vertical: AppHeight.h12),
              child: AppButton(
                // height: 40.h,
                title: AppStrings.confirm(context: context),
                onTap: ()  {
                  context.setLocale(Locale(langCode ?? 'en'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageModel {
  final String image;
  final String name;
  final String langCode;

  LanguageModel({
    required this.image,
    required this.name,
    required this.langCode,
  });
}
