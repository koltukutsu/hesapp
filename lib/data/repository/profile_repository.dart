import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/util/hesap_exception.dart';
import 'package:hesap/util/validators.dart';

class ProfileRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  updateProfile(HesapUser updatedHesapUser) async {
    var _userId = _firebaseAuth.currentUser!.uid;

    try {
      if (updatedHesapUser.name.isEmpty ||
          updatedHesapUser.username.isEmpty ||
          updatedHesapUser.email.isEmpty ||
          updatedHesapUser.phone.isEmpty) {
        throw HesapException("Lütfen tüm alanları doldurun.");
      }

      if (!Validators.isEmailValid(updatedHesapUser.email)) {
        throw HesapException('E-posta adresi geçerli değil.');
      }

      _firebaseAuth.currentUser!.updateEmail(updatedHesapUser.email);
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

    await _firebaseFirestore.collection('users').doc(_userId).get().then(
          (snapshot) => {
            snapshot.reference.set(
              {
                'name': updatedHesapUser.name,
                'username': updatedHesapUser.username,
                'email': updatedHesapUser.email,
                'phone': updatedHesapUser.phone,
              },
              SetOptions(merge: true),
            ),
          },
        );
  }
}
