import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  const FAB({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(Icons.add, size: 32,),
    );
  }
}
