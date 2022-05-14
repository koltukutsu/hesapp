import 'package:hesap/data/model/hesap_user.dart';

abstract class AuthRepository {
  Future<HesapUser?> getHesapUser();
  Future<HesapUser?> signIn(String email, String password);
  Future signInAnonymously();
  Future signUp({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordAgain,
  });
}
