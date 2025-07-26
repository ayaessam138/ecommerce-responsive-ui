import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../../core/helpers/dependency_injection.dart';
import '../../../home/persentation/screens/home_screen.dart';
import '../../../offers/persentation/screens/offers_screen.dart';
import '../../../profile/persentation/Screens/profile_screen.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());
  static BottomNavBarCubit get get => getIt();

  List<Widget> pages = [
    HomeScreen(),
    OffersScreen(),
    ProfileScreen(),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    emit(BottomNavBarInitial());
    currentIndex = index;
    emit(BottomNavBarChangeIndex());
  }
}
