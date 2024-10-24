import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.icon,
    required this.title,
    required this.children,
  });

  final IconData icon;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 16.0),
              Text('$title: ', style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700
              ),),
              const SizedBox(width: 8.0),
              ...children
            ],
          ),
        ],
      ),
    );
  }
}
