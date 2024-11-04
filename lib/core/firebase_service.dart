import 'package:movie_app/models/auth_user.dart';

abstract class FireBaseService
{
  Future<String> sendOtp({required String phoneNo});
  Future<void> verifyOtp({required String smsCode,required String vid});

  Future<AuthUser> getUser({required String uid,required String phoneNo});
}