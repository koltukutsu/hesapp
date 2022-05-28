part of "menu_arama_cubit.dart";

class MenuAramaState extends Equatable {
  final String inputText;
  const MenuAramaState(this.inputText);

  @override
  List<Object> get props => [inputText];
}
