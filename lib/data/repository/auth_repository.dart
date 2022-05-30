import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/util/hesap_exception.dart';
import 'package:hesap/util/validators.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<HesapUser?> getHesapUser() async {
    User? user = _firebaseAuth.currentUser;

    if (user == null) {
      return null;
    }

    var userData =
        _firebaseFirestore.collection('users').where("id", isEqualTo: user.uid);

    var value = await userData.get();

    return HesapUser(
      id: user.uid,
      username: value.docs[0]['username'],
      email: value.docs[0]['email'],
      phone: value.docs[0]['phone'],
    );
  }

  signIn(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw HesapException("Lütfen tüm alanları doldurun.");
      }

      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!_firebaseAuth.currentUser!.emailVerified) {
        throw HesapException("Lütfen e-postanızı doğrulayın");
      }
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'user-not-found':
          throw HesapException("Kullanıcı bulunamadı.");
        case 'wrong-password':
          throw HesapException("Hatalı şifre girdiniz.");
      }
    }
  }

  signInAnonymously() async {
    await _firebaseAuth.signInAnonymously();
  }

  signUp({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordAgain,
  }) async {
    try {
      if (username.isEmpty ||
          email.isEmpty ||
          phone.isEmpty ||
          password.isEmpty) {
        throw HesapException("Lütfen tüm alanları doldurun.");
      }

      if (!Validators.isEmailValid(email)) {
        throw HesapException('E-posta adresi geçerli değil.');
      }

      if (password != passwordAgain) {
        throw HesapException('Girdiğiniz şifreler uyuşmuyor.');
      }

      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      userCredential.user!.sendEmailVerification();

      _firebaseFirestore.collection('users').add({
        'id': _firebaseAuth.currentUser!.uid,
        'username': username,
        'email': email,
        'phone': phone
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'email-already-in-use':
          throw HesapException(
              'Bu e-posta ile kayıtlı bir kullanıcı zaten var.');
        default:
          throw HesapException(
              'Bir hata oluştu. Lütfen daha sonra tekrar deneyin.');
      }
    }
  }
}
