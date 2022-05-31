import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hesap/data/model/card.dart';
import 'package:hesap/data/repository/profile_repository.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  final ProfileRepository _preferencesRepository;

  CardCubit(this._preferencesRepository) : super(CardInitial());

  fetchSavedCards() async {
    List<Card> savedCards = await _preferencesRepository.fetchSavedCards();
    emit(CardLoaded(savedCards));
  }
}
