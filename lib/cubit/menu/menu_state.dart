part of 'menu_cubit.dart';

abstract class MenuState extends Equatable {
  const MenuState();
}

class MenuInitial extends MenuState {
  @override
  List<Object> get props => [];
}

class MenuLoading extends MenuState {
  const MenuLoading();

  @override
  List<Object> get props => [];
}

class MenuLoaded extends MenuState {
  const MenuLoaded(this.menu);

  final List<Product> menu;

  @override
  List<Object> get props => [menu];
}
