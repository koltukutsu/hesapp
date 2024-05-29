import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'constants/nav_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(const NavigationState(NavbarItem.restaurantEkran, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.restaurantEkran:
        emit(const NavigationState(NavbarItem.restaurantEkran, 0));
        break;
      case NavbarItem.siparisEkran:
        emit(const NavigationState(NavbarItem.siparisEkran, 1));
    }
  }
}