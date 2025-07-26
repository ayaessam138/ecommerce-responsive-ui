import 'package:client/features/search/persentation/widgets/search_listview_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_spacing.dart';
import '../../../../core/helpers/app_values.dart';
import '../cubit/search_cubit.dart';

class SearchListviewWidget extends StatelessWidget {
  const SearchListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        // if (state is SearchInitial) {
        //   return Center(child: Text("Start typing to search"));
        // }
         if (state is SearchLoaded) {
          final results = state.results;
          final history = state.history;

          // عايزين نجيب النص المكتوب حاليا من الـ Cubit
          final query = context.read<SearchCubit>().currentQuery ?? '';

          // حالة البحث شغالة لما النص مش فاضي
          final bool isSearching = query.isNotEmpty;

          if (isSearching) {
            // لما المستخدم بيدخل نص والنتائج فاضية نعرض رسالة "No results found"
            if (results.isEmpty) {
              return Center(child: Text("No results found"));
            }
            // لو في نتائج، نعرضها
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: AppWidth.w16),
              itemCount: results.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final title = results[index];
                return SearchListviewItemWidget(
                  title: title,
                  onTapRemove: () {}, // مفيش إزالة في نتائج البحث
                );
              },
              separatorBuilder: (context, index) => AppSpace.vertical(AppHeight.h16),
            );
          } else {
            // لما النص فاضي، نعرض سجل البحث (history)
            if (history.isEmpty) {
              return Center(child: Text("No history found"));
            }
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: AppWidth.w16),
              itemCount: history.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final title = history[index];
                return SearchListviewItemWidget(
                  title: title,
                  onTapRemove: () {
                    context.read<SearchCubit>().removeHistoryItem(title);
                  },
                );
              },
              separatorBuilder: (context, index) => AppSpace.vertical(AppHeight.h16),
            );
          }
        }
        return SizedBox.shrink();
      },
    );
  }
}