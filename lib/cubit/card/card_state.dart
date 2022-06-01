part of '../card/card_cubit.dart';

abstract class CardState extends Equatable {
  const CardState();
}

class CardInitial extends CardState {
  @override
  List<Object> get props => [];
}

class CardPanelState extends CardState {
  const CardPanelState(this.expanded);

  final bool expanded;

  @override
  List<Object> get props => [expanded];
}

class CardLoaded extends CardState {
  const CardLoaded(this.savedCards);

  final List<Card> savedCards;

  @override
  List<Object> get props => [savedCards];
}
