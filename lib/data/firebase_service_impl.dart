import 'dart:async';

import 'package:built_collection/src/list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/core/firebase_service.dart';
import 'package:movie_app/models/auth_user.dart';
import 'package:movie_app/models/review.dart';

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
          _c.complete();
        }
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        await auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException error) {
        throw error;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        vid = verificationId ?? '';
        if (!_c.isCompleted) {
          _c.complete();
        }
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

  CollectionReference<Map<String, dynamic>> get userCollection =>
      firestore.collection("users");

  CollectionReference<Map<String, dynamic>> get movieCollection =>
      firestore.collection("movie");

  CollectionReference<Map<String, dynamic>> get tvCollection =>
      firestore.collection("tv");

  CollectionReference<Map<String, dynamic>> movieReviewCollection(movieId) =>
      movieCollection.doc(movieId).collection("review");

  CollectionReference<Map<String, dynamic>> tvReviewCollection(tvId) =>
      tvCollection.doc(tvId).collection("review");

  @override
  Future<AuthUser> getUser(
      {required String uid, required String phoneNo}) async {
    var userDoc = userCollection.doc(uid);
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

  @override
  Future<void> createMovieReview(
      {required String movieId, required Review review}) async {
    var doc = movieReviewCollection(movieId).doc();
    var a = review.rebuild((b) => b.id = doc.id);
    await doc.set(a.toJson());
  }

  @override
  Future<void> createTVReview(
      {required String tvId, required Review review}) async {
    var doc = tvReviewCollection(tvId).doc();
    var a = review.rebuild((b) => b.id = doc.id);
    await doc.set(a.toJson());
  }

  @override
  Future<void> deleteMovieReview(
      {required String movieId, required String reviewId}) async {
    var doc = movieReviewCollection(movieId).doc(reviewId);
    await doc.delete();
  }

  @override
  Future<void> deleteTVReview(
      {required String tvId, required String reviewId}) async {
    var doc = tvReviewCollection(tvId).doc(reviewId);
    await doc.delete();
  }

  @override
  Future<Review> getMovieReview(
      {required String movieId, required String reviewId}) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await movieReviewCollection(movieId).doc(reviewId).get();
    Map<String, dynamic>? data = doc.data();
    if (data == null) {
      throw "movie not available";
    }
    return Review.fromJson(data);
  }

  @override
  Future<Review> getTvReview(
      {required String tvId, required String reviewId}) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await tvReviewCollection(tvId).doc(reviewId).get();
    Map<String, dynamic>? data = doc.data();
    if (data == null) {
      throw "tv not available";
    }
    return Review.fromJson(data);
  }

  @override
  Stream<BuiltList<Review>> listenMovieReview({required String movieId}) {
    var snapshots = movieReviewCollection(movieId).snapshots();

    return snapshots.map(
      (b) => b.docs.map((e) => Review.fromJson(e.data())).toBuiltList(),
    );
  }

  @override
  Stream<BuiltList<Review>> listenTVReview({required String tvId}) {
    var snapshots = movieReviewCollection(tvId).snapshots();

    return snapshots.map(
      (b) => b.docs.map((e) => Review.fromJson(e.data())).toBuiltList(),
    );
  }

  @override
  Future<void> updateMovieReview(
      {required String movieId, required Review review}) async {
    await movieReviewCollection(movieId).doc(review.id).set(review.toJson());
  }

  @override
  Future<void> updateTvReview(
      {required String tvId, required Review review}) async {
    await tvReviewCollection(tvId).doc(review.id).set(review.toJson());
  }


  @override
  Future<AuthUser> updateUser({required AuthUser user}) async {
    await userCollection.doc(user.id).set(user.toJson());
    return user;
  }

  @override
  Future<AuthUser> updateProfile({required Uint8List file, required AuthUser user}) async {

    final storageRef = FirebaseStorage.instance.ref();
    final userProfileRef = storageRef.child("users/${user.id}.jpg");
    try {
      await userProfileRef.putData(file);
      var url = await userProfileRef.getDownloadURL();

     return await updateUser(user: user.rebuild((a)=>a.profile = url));
    } on FirebaseException catch (e) {
      rethrow;
    }
  }
}
