import 'package:bloc/bloc.dart';

part 'degisen_ekranlar_state.dart';

class DegisenEkranlarCubit extends Cubit<DegisenEkranlarState> {
  int prevIndex;

  DegisenEkranlarCubit({this.prevIndex = 1})
      : super(DegisenEkranlarState(index: 1));

  void onChangedTab(index) {
    emit(DegisenEkranlarState(index: index));
  }

  void onChangedButton(index) {
    if (index > 0) {
      emit(DegisenEkranlarState(index: 1));
    }
  }

  @override
  void onChange(Change<DegisenEkranlarState> change) {
    super.onChange(change);
    prevIndex = change.currentState.index;
  }
}
