import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/data/repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  HesapUser? hesapUser;

  AuthCubit(this._authRepository) : super(AuthInitial()) {
    _initialize();
  }

  _initialize() async {
    try {
      emit(const AuthLoading());

      hesapUser = await _authRepository.getHesapUser();

      emit(hesapUser == null
          ? const AuthNotSignedIn()
          : AuthSignInSuccessful(hesapUser));
    } catch (error) {
      emit(const AuthError("Kullanıcı yüklenemedi."));
    }
  }

  signIn(String email, String password) async {
    try {
      emit(const AuthLoading());

      await _authRepository.signIn(email, password);
      hesapUser = await _authRepository.getHesapUser();

      emit(AuthSignInSuccessful(hesapUser));
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }

  signInAnonymously(String username) async {
    try {
      emit(const AuthLoading());

      await _authRepository.signInAnonymously(username).then(
            (value) => {
              hesapUser = HesapUser(
                id: "",
                name: username,
                username: "",
                email: "",
                phone: "",
                anonymous: true,
              )
            },
          );

      emit(const AuthSignInSuccessful());
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }

  signUp({
    required String name,
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordAgain,
  }) async {
    try {
      emit(const AuthLoading());

      await _authRepository.signUp(
        name: name,
        username: username,
        email: email,
        phone: phone,
        password: password,
        passwordAgain: passwordAgain,
      );

      emit(const AuthSignUpSuccessful());
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }

  signOut() {
    _authRepository.signOut();
    emit(const AuthNotSignedIn());
  }

  HesapUser? getHesapUser() {
    return hesapUser;
  }

  signUpWithGoogle() async {
    // Trigger the authentication flow
    try{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential takenUserCredentials =
    await FirebaseAuth.instance.signInWithCredential(credential);
    final User? userInfo = takenUserCredentials.user;
    final AdditionalUserInfo? userAdditionalInfo =
        takenUserCredentials.additionalUserInfo;

    print("USER INFO: " + userInfo.toString());
  } catch (error) {
      print("ERROR: " + error.toString());
    }
    // if (userInfo != null) {
    //   setUserNames(userName: userInfo.displayName!, userEmail: userInfo.email!);
    // }
    print("ICERDEYIZ");
    // emit(NoAvatars());
    // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance.signInWithCredential(credential)
  }
}
