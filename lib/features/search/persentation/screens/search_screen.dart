
import 'package:easy_debounce/easy_debounce.dart';
import 'package:client/core/widgets/app_text_field.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../emptysecreens/widgets/empty_screen_button.dart';
import '../cubit/search_cubit.dart';
import '../widgets/search_listview_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: BlocProvider<SearchCubit>(
        create: (context) => SearchCubit(),
        child: SafeArea(
          child: Column(
            children: [
             AppbarWidget(title: AppStrings.search(context: context)),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.all(AppPadding.p16),
                      child: AppTextField(
                      onChanged: (value) {
                        EasyDebounce.debounce(
                          'search-debouncer', //
                          const Duration(
                            milliseconds: 500,
                          ), // الوقت اللي بننتظره
                          () {
                            // بعد انتهاء الانتظار، نرسل الكلمة للبحث (search function)
                            BlocProvider.of<SearchCubit>(context).search(value);
                          },
                        );
                      }, validator: (String? val ) {  },
                    ),
                  );
                },
              ),
              Expanded(child: SearchListviewWidget()),
              Padding(
                padding: EdgeInsets.all(AppPadding.p16),
                child: AppButton(
                  title: AppStrings.search(context: context),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
