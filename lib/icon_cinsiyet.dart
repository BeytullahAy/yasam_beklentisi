import 'package:flutter/material.dart';
import './constants.dart';

// 2 tane kadın ve erkek diye container olduğu için kod fazlalığı yapmasın diye
// oluşturduk
class IconCinsiyet extends StatelessWidget {
  final String cinsiyet;
  IconData icon;

  IconCinsiyet({this.cinsiyet, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(height: 20),
        Text(
          cinsiyet,
          // ignore: prefer_const_constructors
          style: kMetinStili,
        ),
      ],
    );
  }
}
