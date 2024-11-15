import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/views/screens/app/movie_home_page.dart';
import 'package:movie_app/views/screens/load_splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  var newLaunch;

  @override
  void initState() {
    super.initState();
    loadNewLaunch();
  }

  loadNewLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
    ((prefs.setBool('newLaunch',false) ));
      bool _newLaunch = prefs.getBool('newLaunch') ?? true;
      print("newLaunch:");
      print(_newLaunch);
      newLaunch = _newLaunch;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: newLaunch ? const MovieHomePage(): const SplashScreen() );
  }
}
