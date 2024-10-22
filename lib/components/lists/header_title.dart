import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, textAlign: TextAlign.center,
        style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20
        ));
  }
}