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
    } else if (user.isAnonymous) {
      return HesapUser(
        id: "",
        name: user.displayName!,
        username: "",
        email: "",
        phone: "",
        anonymous: true,
      );
    }

    var userDoc =
        await _firebaseFirestore.collection('users').doc(user.uid).get();

    return HesapUser(
      id: user.uid,
      name: userDoc['name'],
      username: userDoc['username'],
      email: userDoc['email'],
      phone: userDoc['phone'],
      anonymous: false,
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

  signInAnonymously(String username) async {
    await _firebaseAuth.signInAnonymously().then(
          (auth) => {
            auth.user!.updateDisplayName(username),
          },
        );
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
      if (name.isEmpty ||
          username.isEmpty ||
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

      if (password.length < 6) {
        throw HesapException('Şifre 6 karakterden kısa olamaz.');
      }

      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      userCredential.user!.sendEmailVerification();

      String _userId = _firebaseAuth.currentUser!.uid;

      _firebaseFirestore.collection('users').doc(_userId).set(
          {'name': name, 'username': username, 'email': email, 'phone': phone});
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

  signOut() {
    _firebaseAuth.signOut();
  }
}
