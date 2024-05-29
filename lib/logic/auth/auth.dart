import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/data/repository/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;
  HesapUser? hesapUser;

  AuthProvider(this._authRepository) {
    _initialize();
  }

  _initialize() async {
    try {
      hesapUser = await _authRepository.getHesapUser();
      notifyListeners();
    } catch (error) {
      print("Error: $error");
    }
  }

  signIn(String email, String password) async {
    try {
      await _authRepository.signIn(email, password);
      hesapUser = await _authRepository.getHesapUser();
      notifyListeners();
    } catch (error) {
      print("Error: $error");
    }
  }

  signInAnonymously(String username) async {
    try {
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
      notifyListeners();
    } catch (error) {
      print("Error: $error");
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
      await _authRepository.signUp(
        name: name,
        username: username,
        email: email,
        phone: phone,
        password: password,
        passwordAgain: passwordAgain,
      );
      notifyListeners();
    } catch (error) {
      print("Error: $error");
    }
  }

  // signOut() {
  //   _authRepository.signOut();
  //   notifyListeners();
  //     final credential = GoogleAuthProvider.credential(
  // }

  HesapUser? getHesapUser() {
    return hesapUser;
  }

  // signUpWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );
  //     final UserCredential takenUserCredentials =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //     final User? userInfo = takenUserCredentials.user;
  //     final AdditionalUserInfo? userAdditionalInfo =
  //         takenUserCredentials.additionalUserInfo;
  //     print("USER INFO: " + userInfo.toString());
  //   } catch (error) {
  //     print("ERROR: " + error.toString());
  //   }
  // }
}