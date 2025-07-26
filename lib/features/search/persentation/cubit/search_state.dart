part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<String> results;
  final List<String> history;

  SearchLoaded({required this.results, required this.history});


}