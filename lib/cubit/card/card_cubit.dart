import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hesap/data/model/saved_card.dart';
import 'package:hesap/data/repository/card_repository.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  final CardRepository _cardRepository;

  CardCubit(this._cardRepository) : super(CardInitial());

  fetchSavedCards() async {
    List<SavedCard> savedCards = await _cardRepository.fetchSavedCards();
    emit(CardLoaded(savedCards));
  }
}
