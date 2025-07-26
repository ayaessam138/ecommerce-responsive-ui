import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  PrivacyPolicyWidget({super.key});
  final List<String> infoTexts = [
    '• Personal Information: Name, email address, phone number, payment details, and shipping address.',
    '• Vendor Information: Business name, tax identification, and product details.',
    '• Usage Data: App usage patterns, device information, and IP address.',
    '• Communication Data: Messages or inquiries sent through the app.',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(AppPadding.p16),
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          spacing: AppHeight.h12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "1. Information We Collect",
              style: TextStyles.font14Bold,
            ),

            AutoSizeText(
              "We collect the following types of information:",
              style: TextStyles.font14Regular.copyWith(
                color: ColorsManager.darkGreyColor,
              ),
            ),

            Column(
              children:
                  infoTexts
                      .map(
                        (text) => AutoSizeText(
                          textAlign: TextAlign.start,

                          text,
                          style: TextStyles.font14Regular.copyWith(
                            color: ColorsManager.darkGreyColor,
                          ),
                          softWrap: true,
                        ),
                      )
                      .toList(),
            ),
          ],
        );
      },
    );
  }
}
