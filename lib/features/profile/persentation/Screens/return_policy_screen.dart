import 'package:flutter/material.dart';

import '../../../../core/helpers/app_spacing.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/widgets/appbar_widget.dart';
import '../widgets/settings/privacy_policy_widget.dart';

class ReturnPolicyScreen extends StatelessWidget {
  const ReturnPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarWidget(title: AppStrings.returnPolicy(context: context)),
            AppSpace.vertical(AppHeight.h16),
            Expanded(child: PrivacyPolicyWidget())
          ],
        ),
      ),
    );
  }
}