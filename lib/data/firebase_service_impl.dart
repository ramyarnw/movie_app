import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:movie_app/core/firebase_service.dart';
import 'package:movie_app/models/auth_user.dart';

class FireBaseServiceImpl implements FireBaseService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<String> sendOtp({required String phoneNo}) async {
    String vid = '';
    Completer _c = Completer();
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      codeSent: (String verificationId, int? resendToken) async {
        vid = verificationId ?? '';
        if (!_c.isCompleted) {
          return;
        }
        _c.complete();
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        if (phoneAuthCredential.verificationId?.isNotEmpty ?? false) {
          vid = phoneAuthCredential.verificationId ?? '';
          if (!_c.isCompleted) {
            return;
          }
          _c.complete();
        }
      },
      verificationFailed: (FirebaseAuthException error) {
        throw error;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        vid = verificationId ?? '';
        if (!_c.isCompleted) {
          return;
        }
        _c.complete();
      },
    );
    await Future.wait([_c.future]);
    return vid;
  }

  @override
  Future<void> verifyOtp({required String smsCode, required String vid}) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: vid, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    UserCredential user = await auth.signInWithCredential(credential);
    var uid = user.user?.uid;
    if (uid == null) {
      throw 'user not found';
    }
    return;
  }

  @override
  Future<AuthUser> getUser(
      {required String uid, required String phoneNo}) async {
    var userDoc = firestore.collection("users").doc(uid);
    Map<String, dynamic>? userData = (await userDoc.get()).data();
    if (userData == null) {
      var authUser = AuthUser(
        (b) => b
          ..phoneNo = phoneNo
          ..id = uid,
      );
      userDoc.set(authUser.toJson());
      return authUser;
    }
    return AuthUser.fromJson(userData);
  }
}
