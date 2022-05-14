import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/data/repository/auth/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(AuthInitial()) {
    initialize();
  }

  Future initialize() async {
    try {
      emit(AuthLoading());

      HesapUser? hesapUser = await _authRepository.getHesapUser();

      emit(hesapUser == null
          ? AuthNotSignedIn()
          : AuthSignInSuccessful(hesapUser));
    } catch (error) {
      emit(AuthError("Kullanıcı yüklenemedi."));
    }
  }

  Future signIn(String email, String password) async {
    try {
      emit(AuthLoading());

      await _authRepository.signIn(email, password);
      HesapUser? hesapUser = await _authRepository.getHesapUser();

      emit(AuthSignInSuccessful(hesapUser));
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }

  Future signInAnonymously() async {
    try {
      emit(AuthLoading());

      await _authRepository.signInAnonymously();

      emit(AuthSignInSuccessful());
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }

  Future<void> signUp({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordAgain,
  }) async {
    try {
      emit(AuthLoading());

      await _authRepository.signUp(
        username: username,
        email: email,
        phone: phone,
        password: password,
        passwordAgain: passwordAgain,
      );

      emit(AuthSignUpSuccessful());
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }
}
