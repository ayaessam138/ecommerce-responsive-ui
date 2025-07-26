
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:client/features/categories/persentation/widgets/all_categories/all_categories_listview_widget.dart';
import 'package:flutter/material.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Column(
          children: [
            AppbarWidget(title: AppStrings.categories(context: context)),
            Expanded(child: AllCategoriesListviewWidget())
          ],
        ),
      ),
    );
  }
}
