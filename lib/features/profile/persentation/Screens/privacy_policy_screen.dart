import 'package:client/core/helpers/app_spacing.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_strings.dart';
import '../../../../core/widgets/appbar_widget.dart';
import '../widgets/settings/privacy_policy_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarWidget(title: AppStrings.privacyPolicy(context: context)),
            AppSpace.vertical(AppHeight.h16),
            Expanded(child: PrivacyPolicyWidget())
          ],
        ),
      ),
    );
  }
}
