import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/views/screens/app/movie_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  resetNewLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('SplashScreen:');
    if (kDebugMode) {
      print(prefs.getBool('newLaunch'));
    }
    await   prefs.setBool('newLaunch', true);
    if (kDebugMode) {
      print(prefs.getBool('newLaunch'));
    }

  }

  @override
  void initState() {
    super.initState();
    // resetNewLaunch();
    Future.delayed(
        const Duration(seconds: 2),
            () {
              resetNewLaunch();


              return Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
              return const MovieHomePage();
            }));
            });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
            color: Colors.white,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Movie App',
                      style: TextStyle(color: Colors.blue, fontSize: 40)),
                ],
              ),
            )));
  }
}
