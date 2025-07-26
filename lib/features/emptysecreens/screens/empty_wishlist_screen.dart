import '../../../core/helpers/app_images.dart';
import '../../../core/helpers/app_strings.dart';
import '../widgets/empty_screens_widget.dart';
import 'package:flutter/material.dart';

class EmptyWishlistScreen extends StatelessWidget {
  const EmptyWishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EmptyScreensWidget(
          imagePath: AppImages.emptyWishlist,
          title: AppStrings.emptyWishlist(context: context),
          subTitle:AppStrings.emptyWishlistSubtitle(context: context),
          buttonTitle: AppStrings.backTomHome(context: context),
        ),
      ),
      
    );
  }
}

