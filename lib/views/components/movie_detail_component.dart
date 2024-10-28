import 'package:flutter/material.dart';

import '../screens/cast_detail_screen.dart';

class CastComponent extends StatelessWidget {
  const CastComponent({super.key, required this.imageURL, required this.castName});

  final String castName;
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
              return const CastDetailScreen();
            }));
      },
      child:  Column(
          children: [
            Image.asset(imageURL,width: 100,height: 100,),
            const SizedBox(
              width: 30,
              height: 30,
            ),
            Text(
              castName,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
    );
  }
}
