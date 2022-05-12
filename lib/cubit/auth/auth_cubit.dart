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

  Future<void> initialize() async {
    try {
      emit(AuthLoading());

      var user = await _authRepository.getUser();

      if (user != null) {
        emit(AuthLoggedIn(user));
      } else {
        emit(AuthAnonymous());
      }
    } catch (error) {
      emit(AuthError("Kullanıcı yüklenemedi."));
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      emit(AuthLoading());

      var user = await _authRepository.signIn(email, password);

      emit(AuthLoggedIn(user));
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }

  Future<void> signInAnonymously() async {
    try {
      emit(AuthLoading());

      await _authRepository.signInAnonymously();

      emit(AuthAnonymous());
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

      emit(AuthAnonymous());
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }
}
