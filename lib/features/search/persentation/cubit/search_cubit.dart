import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  List<String> searchhistoryList = [];
  final List<String> apiList = [
    'Apple',
    'Banana',
    'Orange',
    'Mango',
    'Pineapple',
    'Watermelon',
  ];
  void loadHistory() {
    emit(SearchLoaded(results: [], history: searchhistoryList));
  }
  String currentQuery = '';
  void search(String query) {
    currentQuery = query;
    if (query.isEmpty) {
      // مفيش بحث؟ عرض السجل بس
      emit(SearchLoaded(results: [], history: searchhistoryList));
    } else {
      // في بحث؟ اعمل فلترة للنتائج حتى لو فاضية
      final results =
      apiList
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();

      // ضيف كلمة البحث للسجل إذا مش موجودة
      if (!searchhistoryList.contains(query)&&query.trim().length > 2) {
        searchhistoryList.insert(0, query);
        if (searchhistoryList.length > 10) searchhistoryList.removeLast();
      }

      // هنا نزود متغير للتمييز إن البحث شغال (مهم للعرض)
      emit(SearchLoaded(results: results, history: searchhistoryList));
    }
  }

  void removeHistoryItem(String item) {
    searchhistoryList.remove(item);
    emit(SearchLoaded(results: [], history: searchhistoryList));
  }
}
