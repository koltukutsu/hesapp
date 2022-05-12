import 'package:hesap/data/model/hesap_user.dart';

abstract class AuthRepository {
  Future<HesapUser?> getUser();
  Future<bool> isAnonymous();
  Future signInAnonymously();
  Future signIn(String email, String password);
  Future signUp({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordAgain,
  });
  Future signOut();
}
