import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:valem_application/services/models/otopark.dart';
import 'package:valem_application/widgets/toasts.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class MyAuthService {
  final userCollection = FirebaseFirestore.instance.collection('carpark');

  registerCarParkDB(Otopark otopark, String userid) {
    userCollection.doc(userid).set({
      'id': userid,
      'name': otopark.name,
      'phone': otopark.phone,
      'email': otopark.email,
      'password': otopark.password,
      'creationtime': otopark.creationtime
    });
  }

  Future<bool> registerWithMail(Otopark otopark) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: otopark.email,
        password: otopark.password,
      );
      if (userCredential.user != null) {
        final String userid = userCredential.user!.uid;
        MyAuthService().registerCarParkDB(otopark, userid);
      } else {
        log("Veritabanına kaydedilirken bir hata oluştu");
        return false;
      }
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        weakPassword();
        log('zayıf şifre');
      } else if (e.code == 'email-already-in-use') {
        alreadyUse();
        log('Bu email kullanılıyor.');
      }
      return false;
    } catch (e) {
      mailError();
      print(e);
      return false;
    }
  }

  Future<User?> signInEmail(
      {required String mail, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: mail, password: password);
      print("Kullanıcı giriş yaptı ${userCredential.user!.uid} ");
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("Otopark Bulunamadı !");
      } else if (e.code == 'wrong-password') {
        print("Hatalı şifre !");
      }
    }
    return null;
  }

  String getUser() {
    final User user = FirebaseAuth.instance.currentUser!;
    return user.email!;
  }
}
