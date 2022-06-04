import 'package:bloc/bloc.dart';

part 'degisen_ekranlar_state.dart';

class DegisenEkranlarCubit extends Cubit<DegisenEkranlarState> {
  DegisenEkranlarCubit() : super(DegisenEkranlarState(index: 1));

  void onChangedTab(index) => emit(DegisenEkranlarState(index: index));

  void onChangedButton(index) {
    if (index > 0) {
      emit(DegisenEkranlarState(index: 1));
    }
  }
}
