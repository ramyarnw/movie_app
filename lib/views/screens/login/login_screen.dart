import 'package:flutter/material.dart';
import 'package:movie_app/view_model/app_view_model.dart';
import 'package:movie_app/views/mixins/auth_mixin.dart';
import 'package:movie_app/views/screens/login/login_verify_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with AuthMixin<LoginScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await sendOtp(phoneNo: _controller.text);
                // String vid = await context
                //         .read<AppViewModel>()
                //     .sendOtp(phoneNo: _controller.text);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (BuildContext context) {
                //   return LoginVerifyScreen(
                //     vid: vid,
                //   );
                // }));
              },
              child: const Text('Send OTP'),
            )
          ],
        ),
      ),
    );
  }
}
