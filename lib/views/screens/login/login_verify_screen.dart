import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:movie_app/views/mixins/auth_mixin.dart';
import 'package:movie_app/views/screens/app/movie_home_page.dart';
import 'package:provider/provider.dart';

import '../../../view_model/app_view_model.dart';

class LoginVerifyScreen extends StatefulWidget {
  const LoginVerifyScreen({super.key, required this.vid});

  final String vid;

  @override
  State<LoginVerifyScreen> createState() => _LoginVerifyScreenState();
}

class _LoginVerifyScreenState extends State<LoginVerifyScreen> with AuthMixin<LoginVerifyScreen> {
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
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Type otp here',
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await verifyOtp(smsCode: _controller.text, vid: widget.vid);
            },
              // await context
              //     .read<AppViewModel>()
              //     .verifyOtp(smsCode: _controller.text, vid: widget.vid);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (BuildContext context) {
              //       return const MovieHomePage();
              //     }));            },
            child: const Text('Submit OTP'),
          )
        ],
      ),
    );
  }
}
