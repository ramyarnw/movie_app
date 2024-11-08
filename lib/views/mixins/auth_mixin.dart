import 'package:flutter/material.dart';
import 'package:movie_app/view_model/app_view_model.dart';
import 'package:provider/provider.dart';

import '../screens/login/login_verify_screen.dart';
import '../screens/app/movie_home_page.dart';

mixin AuthMixin<T extends StatefulWidget> on State<T> {
  Future<void> sendOtp({required String phoneNo}) async {
    try {
      var vid = await context.read<AppViewModel>().sendOtp(phoneNo: phoneNo);
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return LoginVerifyScreen(
          vid: vid,
        );
      }));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }
  Future<void> verifyOtp({required String smsCode, required String vid}) async {
    try {
      await context
          .read<AppViewModel>()
          .verifyOtp(smsCode: smsCode, vid: vid);
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
            return const MovieHomePage();
          }));
    }catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  }

