import 'package:hesap/data/model/hesap_user.dart';

abstract class AuthRepository {
  Future<HesapUser?> getHesapUser();
  signIn(String email, String password);
  signInAnonymously();
  signUp({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordAgain,
  });
}
