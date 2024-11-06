import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../models/app_state.dart';
import '../../models/auth_user.dart';
import '../../view_model/app_view_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  AuthUser user = AuthUser(
    (b) => b
      ..name = ''
      ..phoneNo = ''
    ..id =''
  );

  @override
  void initState()   {
    super.initState();
    user = context.read<AppViewModel>().getState().currentUser!;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit profile'),
        ),
        body: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  XFile? file = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (file == null) {
                    return;
                  }
                  Uint8List bytes = await file.readAsBytes();
                  await context
                      .read<AppViewModel>()
                      .updateProfile(file: bytes, user: user);
                },
                child: CircleAvatar(
                  child: user.profile?.isNotEmpty ?? false
                      ? Image.network(user.profile!)
                      : Text(user.name.toString()),
                ),
              ),
              TextFormField(
                initialValue: user.name,
                onChanged: (String s) {
                  user = user.rebuild((p) => p.name = s);
                  setState(() {});
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                enabled: false,
                initialValue: user.phoneNo,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone number',
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<AppViewModel>().updateUser(user: user);
                  },
                  child: const Text('Update User'))
            ],
          ),
        ));
  }
}
