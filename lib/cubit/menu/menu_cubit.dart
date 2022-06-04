import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hesap/data/model/product.dart';
import 'package:hesap/data/repository/menu_repository.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final MenuRepository _menuRepository;
  MenuCubit(this._menuRepository) : super(MenuInitial());

  fetchMenu(String restaurantId) async {
    emit(const MenuLoading());

    var menu = await _menuRepository.fetchMenu(restaurantId);

    emit(MenuLoaded(menu));
  }
}
