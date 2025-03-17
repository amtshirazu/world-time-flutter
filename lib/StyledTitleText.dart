import 'package:flutter/material.dart';

class Styledtitletext extends StatelessWidget {
  const Styledtitletext(this.text,{super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 25.0,
      color: Colors.white,
    ),
    );
  }
}
